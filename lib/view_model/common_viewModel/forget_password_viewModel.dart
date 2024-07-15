import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/user/auth_repository.dart';
import 'package:radigone_v3/view_model/services/alert_services.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';

import '../../utils/constants.dart';

class ForgetPasswordViewModel with ChangeNotifier {
  late NavigationServices _navigationServices;
  late AlertServices _alertServices;
  ForgetPasswordViewModel() {
    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    _alertServices = getIt.get<AlertServices>();
  }

  String? _emailAddress;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setEmailAddress(String? emailAddress) {
    _emailAddress = emailAddress;
    notifyListeners();
  }

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  final UserAuthRepository _myRepo = UserAuthRepository();

  Future<bool> sendViewerOtp(
      {required BuildContext context, String? emailAddress}) async {
    setIsLoading(true);
    setEmailAddress(emailAddress);

    if (_emailAddress != null &&
        Constants.EMAIL_VALIDATION_REGEX.hasMatch(_emailAddress!)) {
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({"email": _emailAddress!});
      await _myRepo
          .userForgotPasswordApi(headers: headers, body: body)
          .then((value) {
        _alertServices.showToast(message: value.message.toString());
        setIsLoading(false);
        return true;
      }).onError((error, stackTrace) {
        _alertServices.showToast(message: error.toString());
        setIsLoading(false);
        return false;
      });
    } else {
      _alertServices.showToast(message: "Please Enter Valid Email Address");
      setIsLoading(false);
      return false;
    }
    return true;
  }

  Future<bool> sendSponsorOtp(
      {required BuildContext context, String? emailAddress}) async {
    return true;
  }

  Future<bool> sendAgentOtp(
      {required BuildContext context, String? emailAddress}) async {
    return true;
  }
}
