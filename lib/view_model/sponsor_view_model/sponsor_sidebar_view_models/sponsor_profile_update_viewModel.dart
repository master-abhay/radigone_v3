import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/models/sponsor_models/login_sponsor_model.dart';

import '../../../repositories/sponsor/auth_repository.dart';
import '../../services/alert_services.dart';
import '../../services/flutter_secure_storage/secure_storage.dart';


class FetchSponsorInformation with ChangeNotifier {
  LoginSponsorModel loginSponsorModel = LoginSponsorModel();

  String? _mobile;
  String? _password;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  late AlertServices _alertServices;
  final SponsorAuthRepository _myRepo = SponsorAuthRepository();

  FetchSponsorInformation() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
  }

  Future<void> setMobileAndPassword() async {
    _mobile = await SecureStorage().readSecureData('mobile');
    _password = await SecureStorage().readSecureData('password');
  }

  Future<bool> loginSponsor(BuildContext context) async {
    try {
      // setLoading(true);
      await setMobileAndPassword();

      var header = {'Content-Type': 'application/json'};
      var body = jsonEncode({"mobile": _mobile, "password": _password});

      final value = await _myRepo.sponsorLoginApi(body: body, header: header);

      loginSponsorModel = value;
      // setLoading(false);
      return true;
    } catch (error) {
      // setLoading(false);
      _alertServices.flushBarErrorMessages(error.toString(), context);
      return false;
    }
  }

  // void setLoading(bool loading) {
  //   _isLoading = loading;
  //   notifyListeners();
  // }
}


// Creating the services with the help of the state management using the providerState management:

class SponsorProfileUpdateViewModel with ChangeNotifier {
  // Dispose controllers and focus nodes to free up resources
  // @override
  //  Future<void>disposing() async{
  //   _firstName.dispose();
  //   _lastName.dispose();
  //   _email.dispose();
  //   _mobileNumber.dispose();
  //   _businessCategory.dispose();
  //   _businessSubcategory.dispose();
  //   _profilingServices.dispose();
  //   _pan.dispose();
  //   _optOutMessage.dispose();
  //   _firmName.dispose();
  //   _firmType.dispose();
  //   _designation.dispose();
  //   _address.dispose();
  //   _city.dispose();
  //   _state.dispose();
  //   _zip.dispose();
  //
  //   _firstNameFocusNode.dispose();
  //   _lastNameFocusNode.dispose();
  //   _emailFocusNode.dispose();
  //   _mobileNumberFocusNode.dispose();
  //   _businessCategoryFocusNode.dispose();
  //   _businessSubcategoryFocusNode.dispose();
  //   _profilingServicesFocusNode.dispose();
  //   _panFocusNode.dispose();
  //   _optOutMessageFocusNode.dispose();
  //   _firmNameFocusNode.dispose();
  //   _firmTypeFocusNode.dispose();
  //   _designationFocusNode.dispose();
  //   _addressFocusNode.dispose();
  //   _cityFocusNode.dispose();
  //   _stateFocusNode.dispose();
  //   _zipFocusNode.dispose();

  // }
}
