// Creating the services with the help of the state management using the providerState management:

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_profile_information_viewModel.dart';

import '../../../repositories/sponsor/auth_repository.dart';
import '../../services/alert_services.dart';
import '../../services/auth_services.dart';
import '../../services/flutter_secure_storage/secure_storage.dart';
import '../../services/navigation_services.dart';

class LoginSponsorProvider with ChangeNotifier {
  String? _countryCode;
  String? _mobile;
  String? _password;

  set setCountryCode(String? countryCode) {
    if (countryCode != null && countryCode.isNotEmpty) {
      _countryCode = countryCode;
      if (kDebugMode) {
        print("countryCode set..");
      }
      notifyListeners();
    }
  }

  set setMobile(String? mobile) {
    if (mobile != null && mobile.isNotEmpty) {
      _mobile = mobile;
      if (kDebugMode) {
        print("Mobile set..");
      }
      notifyListeners();
    }
  }

  set setPassword(String? password){
    if (password != null && password.isNotEmpty) {
      _password = password;
      if (kDebugMode) {
        print("Password set..");
      }
      notifyListeners();
    }
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  late AlertServices _alertServices;
  late NavigationServices _navigationServices;
  late AuthService _authService;

  LoginSponsorProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _navigationServices = getIt.get<NavigationServices>();
    _authService = getIt.get<AuthService>();
  }

  final _myRepo = SponsorAuthRepository();

  Future<bool> loginSponsor({
    required BuildContext context,
    required String countryCode,
    required String mobile,
    required String password,
  }) async {
    setLoading(true);
    setCountryCode = countryCode;
    setMobile = mobile;
    setPassword = password;


    var header = {'Content-Type': 'application/json; charset=UTF-8'};
    var body = jsonEncode({
      "country_code": _countryCode,
      "mobile": _mobile,
      "password": _password,
    });

    _myRepo.sponsorLoginApi(body: body, header: header).then((value) async {
      // saveDetails(value);
      // Future.delayed(Duration(seconds: 3));
      await SecureStorage().writeSecureData('username', value.data!.username!);
      await SecureStorage().writeSecureData('password', _password!);
      await SecureStorage()
          .writeSecureData('token', '${value.tokenType} ${value.token}');
      await SecureStorage()
          .writeSecureData('mobile', value.data!.mobile.toString());
      await SecureStorage().writeSecureData('id', value.data!.id.toString());
      //Saving token in sharedPreferences:
      await _authService.saveSponsorToken(
          '${value.tokenType.toString()} ${value.token.toString()}');
      await _authService
          .saveSponsorName('${value.data!.firstname} ${value.data!.lastname}');
      await _authService.saveSponsorEmail('${value.data!.email}');
      await _authService.saveSponsorImageLink('${value.data!.image}');



      if(value.data!.sv! != 1){
        //go for sms verification:

      }

      if(value.data!.rv! != 1){
        //go for registration payment:

      }

      //<----------------------------------------------------------------Initialization of Data------------------------>
      await Provider.of<SponsorProfileInformationViewModel>(context,
              listen: false)
          .fetchProfileInformation(context);
//<----------------------------------------------------------------Data Initialized>---------------------------------------------------------------->


      _navigationServices.pushReplacementNamed('/sponsorMainView');
      // _navigationServices.push(MaterialPageRoute(builder: (context)=>const SponsorMainScreen(sponsorHome: true, sponsorDeposit: false, sponsorHistory: false, sponsorProfile: false)));
      if (kDebugMode) {
        print("Sponsor logged in Successfully");
      }

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);

      _alertServices.flushBarErrorMessages(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });

    return true;
  }
}
