// Creating the services with the help of the state management using the providerState management:

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/agent/agent_auth_repository.dart';

import '../../../models/agent_models/authentication_models/agent_login_model.dart';
import '../../services/alert_services.dart';
import '../../services/auth_services.dart';
import '../../services/flutter_secure_storage/secure_storage.dart';
import '../../services/navigation_services.dart';

class AgentLoginViewModel with ChangeNotifier {
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

  AgentLoginViewModel() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _navigationServices = getIt.get<NavigationServices>();
    _authService = getIt.get<AuthService>();
  }

  Future<void> saveDetails(AgentLoginModel value) async {
    await SecureStorage().writeSecureData('username', value.data!.username!);
    await SecureStorage().writeSecureData('password', _password!);
    await SecureStorage()
        .writeSecureData('token', '${value.tokenType} ${value.token}');
    await SecureStorage()
        .writeSecureData('mobile', value.data!.mobile.toString());
    await SecureStorage().writeSecureData('id', value.data!.id.toString());
    //Saving token in sharedPreferences:
    await _authService.saveAgentToken(
        '${value.tokenType.toString()} ${value.token.toString()}');
    await _authService
        .saveAgentName('${value.data!.firstname} ${value.data!.lastname}');
    await _authService.saveAgentEmail('${value.data!.email}');
    await _authService.saveAgentImageLink('${value.data!.image}');

    if (kDebugMode) {
      print(await SecureStorage().readSecureData('username'));
      print(await SecureStorage().readSecureData('password'));
      print(await SecureStorage().readSecureData('token'));
      print(await SecureStorage().readSecureData('mobile'));
      print(await SecureStorage().readSecureData('id'));
    }
  }

  final _myRepo = AgentAuthRepository();

  Future<bool> loginAgent({
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

    _myRepo.agentLoginApi(body: body, header: header).then((value) async {
      // saveDetails(value);
      await SecureStorage().writeSecureData('username', value.data!.username!);
      await SecureStorage().writeSecureData('password', _password!);
      await SecureStorage()
          .writeSecureData('token', '${value.tokenType} ${value.token}');
      await SecureStorage()
          .writeSecureData('mobile', value.data!.mobile.toString());
      await SecureStorage().writeSecureData('id', value.data!.id.toString());
      //Saving token in sharedPreferences:
      await _authService.saveAgentToken(
          '${value.tokenType.toString()} ${value.token.toString()}');
      await _authService
          .saveAgentName('${value.data!.firstname} ${value.data!.lastname}');
      await _authService.saveAgentEmail('${value.data!.email}');
      await _authService.saveAgentImageLink('${value.data!.image}');



      if(value.data!.sv! != 1){
        //go for sms verification:

      }

      if(value.data!.rv! != 1){
        //go for registration payment:

      }
      _navigationServices.pushReplacementNamed('/agentMainView');
      if (kDebugMode) {
        print("Agent logged in Successfully");
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
