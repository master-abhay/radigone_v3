import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/user/auth_repository.dart';
import 'package:radigone_v3/view/user_view/user_authentication_view/reset_password_view.dart';
import 'package:radigone_v3/view_model/services/alert_services.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';

class UserOtpVerificationViewModel with ChangeNotifier {
  late NavigationServices _navigationServices;
  late AlertServices _alertServices;
  UserOtpVerificationViewModel() {
    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    _alertServices = getIt.get<AlertServices>();
  }

  String? _emailAddress;
  String? _code;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setEmailAddress(String? emailAddress) {
    _emailAddress = emailAddress;
    notifyListeners();
  }

  setCode(String? code) {
    _code = code;
    notifyListeners();
  }

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  final UserAuthRepository _myRepo = UserAuthRepository();

  Future<bool> verifyOtp(
      {required BuildContext context,
      String? emailAddress,
      String? code}) async {
    setIsLoading(true);
    setEmailAddress(emailAddress);
    setCode(code);

    if (_code != null && _code!.length == 6) {
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({"email": _emailAddress!, "code": _code!});
      await _myRepo
          .userOtpVerificationApi(headers: headers, body: body)
          .then((value) {
        if (value.message.toString() == "Invalid token") {
          _alertServices.showToast(message: "Wrong OTP Entered!");
        }
        _alertServices.showToast(message: value.message.toString());
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResetPassword(
                      emailAddress: _emailAddress!,
                      token: value.token!,
                    )));
        setIsLoading(false);
        return true;
      }).onError((error, stackTrace) {
        _alertServices.showToast(message: error.toString());
        setIsLoading(false);
        return false;
      });
    } else {
      _alertServices.showToast(message: "Enter Otp");
      setIsLoading(false);
      return false;
    }
    return true;
  }
}
