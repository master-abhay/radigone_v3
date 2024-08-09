// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:radigone_v3/repositories/sponsor/auth_repository.dart';
// import 'package:radigone_v3/repositories/user/auth_repository.dart';
// import 'package:radigone_v3/view/common_view/forgot_password_reset_password_view.dart';
// import 'package:radigone_v3/view_model/services/alert_services.dart';
// import 'package:radigone_v3/view_model/services/navigation_services.dart';
//
// import '../../repositories/agent/agent_auth_repository.dart';
// import '../../utils/constants.dart';
//
// class OtpVerificationViewModel with ChangeNotifier {
//   late NavigationServices _navigationServices;
//   late AlertServices _alertServices;
//   OtpVerificationViewModel() {
//     final GetIt getIt = GetIt.instance;
//     _navigationServices = getIt.get<NavigationServices>();
//     _alertServices = getIt.get<AlertServices>();
//   }
//
//   String? _emailAddress;
//   String? _code;
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//
//   setEmailAddress(String? emailAddress) {
//     _emailAddress = emailAddress;
//     notifyListeners();
//   }
//
//   setCode(String? code) {
//     _code = code;
//     notifyListeners();
//   }
//
//   setIsLoading(bool isLoading) {
//     _isLoading = isLoading;
//     notifyListeners();
//   }
//
//   final UserAuthRepository _userAuthRepository = UserAuthRepository();
//   final SponsorAuthRepository _sponsorAuthRepository = SponsorAuthRepository();
//   final AgentAuthRepository _agentAuthRepository = AgentAuthRepository();
//
//   Future<bool> viewerVerifyOtp(
//       {required BuildContext context,
//         required UserType userType,
//       String? emailAddress,
//       String? code}) async {
//     setIsLoading(true);
//     setEmailAddress(emailAddress);
//     setCode(code);
//
//     if (_code != null && _code!.length == 6) {
//       var headers = {
//         'Content-Type': 'application/json',
//       };
//       var body = jsonEncode({"email": _emailAddress!, "token": _code!});
//       await _userAuthRepository
//           .userOtpVerificationApi(headers: headers, body: body)
//           .then((value) {
//         if (value.message.toString() == "Invalid token") {
//           _alertServices.showToast(message: "Wrong OTP Entered!");
//           return false;
//         }
//         _alertServices.showToast(message: value.message.toString());
//         _navigationServices.goBack();
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ResetPassword(
//                   userType: userType,
//                       emailAddress: _emailAddress!,
//                       token: value.token!,
//                     )));
//         setIsLoading(false);
//         return true;
//       }).onError((error, stackTrace) {
//         _alertServices.showToast(message: error.toString());
//         setIsLoading(false);
//         return false;
//       });
//     } else {
//       _alertServices.showToast(message: "Enter Otp");
//       setIsLoading(false);
//       return false;
//     }
//     return true;
//   }
//
//   Future<bool> sponsorVerifyOtp(
//       {required BuildContext context,
//         required UserType userType,
//
//         String? emailAddress,
//       String? code}) async {
//     setIsLoading(true);
//     setEmailAddress(emailAddress);
//     setCode(code);
//
//     if (_code != null && _code!.length == 6) {
//       var headers = {
//         'Content-Type': 'application/json',
//       };
//       var body = jsonEncode({"email": _emailAddress!, "token": _code!});
//       await _sponsorAuthRepository
//           .sponsorOtpVerificationApi(headers: headers, body: body)
//           .then((value) {
//         if (value.message.toString() == "Invalid token") {
//           _alertServices.showToast(message: "Wrong OTP Entered!");
//           return false;
//         }
//         _alertServices.showToast(message: value.message.toString());
//         _navigationServices.goBack();
//
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ResetPassword(
//                   userType: userType,
//                       emailAddress: _emailAddress!,
//                       token: value.token!,
//
//                     )));
//         setIsLoading(false);
//         return true;
//       }).onError((error, stackTrace) {
//         _alertServices.showToast(message: error.toString());
//         setIsLoading(false);
//         return false;
//       });
//     } else {
//       _alertServices.showToast(message: "Enter Otp");
//       setIsLoading(false);
//       return false;
//     }
//     return true;
//   }
//
//   Future<bool> agentVerifyOtp(
//       {required BuildContext context,
//         required UserType userType,
//         String? emailAddress,
//       String? code}) async {
//     setIsLoading(true);
//     setEmailAddress(emailAddress);
//     setCode(code);
//
//     if (_code != null && _code!.length == 6) {
//       var headers = {
//         'Content-Type': 'application/json',
//       };
//       var body = jsonEncode({"email": _emailAddress!, "token": _code!});
//       await _agentAuthRepository
//           .agentOtpVerificationApi(headers: headers, body: body)
//           .then((value) {
//         if (value.message.toString() == "Invalid token") {
//           _alertServices.showToast(message: "Wrong OTP Entered!");
//           return false;
//         }
//         _alertServices.showToast(message: value.message.toString());
//         _navigationServices.goBack();
//         _navigationServices.goBack();
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ResetPassword(
//                   userType: userType,
//                       emailAddress: _emailAddress!,
//                       token: value.token!,
//                     )));
//         setIsLoading(false);
//         return true;
//       }).onError((error, stackTrace) {
//         _alertServices.showToast(message: error.toString());
//         setIsLoading(false);
//         return false;
//       });
//     } else {
//       _alertServices.showToast(message: "Enter Otp");
//       setIsLoading(false);
//       return false;
//     }
//     return true;
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/sponsor/auth_repository.dart';
import 'package:radigone_v3/repositories/user/auth_repository.dart';
import 'package:radigone_v3/view/common_view/forgot_password_reset_password_view.dart';
import 'package:radigone_v3/view_model/services/alert_services.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import '../../repositories/agent/agent_auth_repository.dart';
import '../../utils/constants.dart';

class OtpVerificationViewModel with ChangeNotifier {
  late final NavigationServices _navigationServices;
  late final AlertServices _alertServices;
  late final UserAuthRepository _userAuthRepository;
  late final SponsorAuthRepository _sponsorAuthRepository;
  late final AgentAuthRepository _agentAuthRepository;

  OtpVerificationViewModel() {
    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    _alertServices = getIt.get<AlertServices>();
    _userAuthRepository = UserAuthRepository();
    _sponsorAuthRepository = SponsorAuthRepository();
    _agentAuthRepository = AgentAuthRepository();
  }

  String? _emailAddress;
  String? _code;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set emailAddress(String? value) {
    _emailAddress = value;
    notifyListeners();
  }

  set code(String? value) {
    _code = value;
    notifyListeners();
  }

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> _verifyOtp({
    required BuildContext context,
    required UserType userType,
    required Future<dynamic> Function(Map<String, String> headers, String body) apiCall,
  }) async {
    if (_code == null || _code!.length != 6) {
      _alertServices.showToast(message: "Enter a valid OTP");
      return false;
    }

    setIsLoading(true);

    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({"email": _emailAddress!, "token": _code!});

    try {
      final response = await apiCall(headers, body);

      if (response.message == "Invalid token") {
        _alertServices.showToast(message: "Wrong OTP Entered!");
        return false;
      }

      _alertServices.showToast(message: response.message.toString());
      _navigationServices.goBack();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPassword(
            userType: userType,
            emailAddress: _emailAddress!,
            token: response.token!,
          ),
        ),
      );
      return true;
    } catch (error) {
      _alertServices.showToast(message: error.toString());
      return false;
    } finally {
      setIsLoading(false);
    }
  }

  Future<bool> verifyOtpForUser({
    required BuildContext context,
    required UserType userType,
    String? emailAddress,
    String? code,
  }) async {
    emailAddress = emailAddress;
    code = code;
    return _verifyOtp(
      context: context,
      userType: userType,
      apiCall: (headers, body) => _userAuthRepository.userOtpVerificationApi(headers: headers, body: body),
    );
  }

  Future<bool> verifyOtpForSponsor({
    required BuildContext context,
    required UserType userType,
    String? emailAddress,
    String? code,
  }) async {
    emailAddress = emailAddress;
    code = code;
    return _verifyOtp(
      context: context,
      userType: userType,
      apiCall: (headers, body) => _sponsorAuthRepository.sponsorOtpVerificationApi(headers: headers, body: body),
    );
  }

  Future<bool> verifyOtpForAgent({
    required BuildContext context,
    required UserType userType,
    String? emailAddress,
    String? code,
  }) async {
    emailAddress = emailAddress;
    code = code;
    return _verifyOtp(
      context: context,
      userType: userType,
      apiCall: (headers, body) => _agentAuthRepository.agentOtpVerificationApi(headers: headers, body: body),
    );
  }
}

