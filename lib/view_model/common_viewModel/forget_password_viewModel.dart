import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/user/auth_repository.dart';
import 'package:radigone_v3/view_model/services/alert_services.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';

import '../../utils/constants.dart';

class ForgetPasswordViewModel with ChangeNotifier {
  late final NavigationServices _navigationServices;
  late final AlertServices _alertServices;
  final UserAuthRepository _myRepo = UserAuthRepository();

  ForgetPasswordViewModel() {
    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    _alertServices = getIt.get<AlertServices>();
  }

  String? _emailAddress;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setEmailAddress(String? emailAddress) {
    _emailAddress = emailAddress;
    notifyListeners();
  }

  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<bool> sendViewerOtp({required BuildContext context, String? emailAddress}) async {
    setIsLoading(true);
    setEmailAddress(emailAddress);

    if (_emailAddress != null && Constants.EMAIL_VALIDATION_REGEX.hasMatch(_emailAddress!)) {
      try {
        var headers = {'Content-Type': 'application/json'};
        var body = jsonEncode({"email": _emailAddress!});
        var response = await _myRepo.userForgotPasswordApi(headers: headers, body: body);

        // Assuming `response` has a `message` property
        _alertServices.showToast(message: response.message.toString());
        return true;
      } catch (error) {
        _alertServices.showToast(message: _getErrorMessage(error));
        return false;
      } finally {
        setIsLoading(false);
      }
    } else {
      _alertServices.showToast(message: "Please enter a valid email address.");
      setIsLoading(false);
      return false;
    }
  }

  Future<bool> sendSponsorOtp({required BuildContext context, String? emailAddress}) async {
    // Implement functionality here
    return true;
  }

  Future<bool> sendAgentOtp({required BuildContext context, String? emailAddress}) async {
    // Implement functionality here
    return true;
  }

  String _getErrorMessage(dynamic error) {
    // Customize this method based on the error types you expect
    if (error is Exception) {
      return error.toString();
    }
    return 'An unexpected error occurred.';
  }
}
