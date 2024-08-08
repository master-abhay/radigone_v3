import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/common/common_repository.dart';
import 'package:radigone_v3/resources/app_urls.dart';
import 'package:radigone_v3/view_model/services/alert_services.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';

import '../../utils/constants.dart';

class SmsVerificationViewModel with ChangeNotifier {
  late NavigationServices _navigationServices;
  late AlertServices _alertServices;
  final CommonRepository _commonRepository = CommonRepository();

  SmsVerificationViewModel() {
    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    _alertServices = getIt.get<AlertServices>();
  }

  String? _mobile;
  String? _code;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set setMobile(String? value) {
    _mobile = value;
    notifyListeners();
  }

  set setCode(String? value) {
    _code = value;
    notifyListeners();
  }

  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<bool> verifySms({
    required BuildContext context,
    required UserType userType,
    String? number,
    String? code,
  }) async {
    setIsLoading(true);

    setMobile = number;
    setCode = code;

    if (_code != null && _code!.length == 6) {
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({"mobile": _mobile!, "ver_code": _code!});

      final url = _getVerificationUrl(userType);

      try {
        final response = await _commonRepository.smsVerification(
          headers: headers,
          body: body,
          appUrl: url,
        );

        if (response.message == "Invalid token") {
          _alertServices.showToast(message: "Wrong OTP Entered!");
          return false;
        }

        _alertServices.showToast(message: response.message.toString());
        setIsLoading(false);
        return true;

      } catch (error) {
        _alertServices.showToast(message: error.toString());
        setIsLoading(false);
        return false;
      }
    } else {
      _alertServices.showToast(message: "Enter OTP");
      setIsLoading(false);
      return false;
    }
  }

  String _getVerificationUrl(UserType userType) {
    switch (userType) {
      case UserType.viewer:
        return AppUrls.viewerSmsVerification;
      case UserType.sponsor:
        return AppUrls.sponsorSmsVerification;
      case UserType.agent:
        return AppUrls.agentSmsVerification;
      default:
        throw Exception('Unknown user type');
    }
  }
}
