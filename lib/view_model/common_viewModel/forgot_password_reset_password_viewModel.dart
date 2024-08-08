import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/agent/agent_auth_repository.dart';
import 'package:radigone_v3/repositories/sponsor/auth_repository.dart';
import 'package:radigone_v3/repositories/user/auth_repository.dart';
import 'package:radigone_v3/view_model/services/alert_services.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';

class ResetPasswordViewModel with ChangeNotifier {
  late NavigationServices _navigationServices;
  late AlertServices _alertServices;
  ResetPasswordViewModel() {
    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    _alertServices = getIt.get<AlertServices>();
  }

  String? _emailAddress;
  String? _token;
  String? _password;
  String? _passwordConfirmation;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setEmailAddress(String? emailAddress) {
    _emailAddress = emailAddress;
    notifyListeners();
  }

  setToken(String? token) {
    _token = token;
    notifyListeners();
  }

  setPassword(String? password) {
    _password = password;
    notifyListeners();
  }

  setPasswordConfirmation(String? passwordConfirmation) {
    _passwordConfirmation = passwordConfirmation;
    notifyListeners();
  }

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  final UserAuthRepository _userAuthRepository = UserAuthRepository();
  final SponsorAuthRepository _sponsorAuthRepository = SponsorAuthRepository();
  final AgentAuthRepository _agentAuthRepository = AgentAuthRepository();

  Future<bool> userResetPassword(
      {required BuildContext context,
      required String emailAddress,
      required String token,
      required String newPassword}) async {
    setIsLoading(true);
    setEmailAddress(emailAddress);
    setToken(token);
    setPassword(newPassword);
    setPasswordConfirmation(newPassword);

    if (_token != null &&
        _emailAddress != null &&
        _password != null &&
        _passwordConfirmation != null) {
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": _emailAddress!,
        "token": _token!,
        "password": _password!,
        "password_confirmation": _passwordConfirmation!
      });
      await _userAuthRepository
          .userResetPasswordApi(headers: headers, body: body)
          .then((value) {
        _alertServices.showToast(message: value.message.toString());
        _navigationServices.pushReplacementNamed("/selectLoginPage");
        setIsLoading(false);
        return true;
      }).onError((error, stackTrace) {
        _alertServices.showToast(message: error.toString());
        setIsLoading(false);
        return false;
      });
    } else {
      _alertServices.showToast(message: "Something went wrong");
      setIsLoading(false);
      return false;
    }
    return true;
  }

  Future<bool> sponsorResetPassword(
      {required BuildContext context,
      required String emailAddress,
      required String token,
      required String newPassword}) async {
    setIsLoading(true);
    setEmailAddress(emailAddress);
    setToken(token);
    setPassword(newPassword);
    setPasswordConfirmation(newPassword);

    if (_token != null &&
        _emailAddress != null &&
        _password != null &&
        _passwordConfirmation != null) {
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": _emailAddress!,
        "token": _token!,
        "password": _password!,
        "password_confirmation": _passwordConfirmation!
      });
      await _sponsorAuthRepository
          .sponsorResetPasswordApi(headers: headers, body: body)
          .then((value) {
        _alertServices.showToast(message: value.message.toString());
        _navigationServices.pushReplacementNamed("/selectLoginPage");
        setIsLoading(false);
        return true;
      }).onError((error, stackTrace) {
        _alertServices.showToast(message: error.toString());
        setIsLoading(false);
        return false;
      });
    } else {
      _alertServices.showToast(message: "Something went wrong");
      setIsLoading(false);
      return false;
    }
    return true;
  }

  Future<bool> agentResetPassword(
      {required BuildContext context,
      required String emailAddress,
      required String token,
      required String newPassword}) async {
    setIsLoading(true);
    setEmailAddress(emailAddress);
    setToken(token);
    setPassword(newPassword);
    setPasswordConfirmation(newPassword);

    if (_token != null &&
        _emailAddress != null &&
        _password != null &&
        _passwordConfirmation != null) {
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": _emailAddress!,
        "token": _token!,
        "password": _password!,
        "password_confirmation": _passwordConfirmation!
      });
      await _agentAuthRepository
          .agentResetPasswordApi(headers: headers, body: body)
          .then((value) {
        _alertServices.showToast(message: value.message.toString());

        _navigationServices.goBack();
        _navigationServices.pushReplacementNamed("/selectLoginPage");
        setIsLoading(false);
        return true;
      }).onError((error, stackTrace) {
        _alertServices.showToast(message: error.toString());
        setIsLoading(false);
        return false;
      });
    } else {
      _alertServices.showToast(message: "Something went wrong");
      setIsLoading(false);
      return false;
    }
    return true;
  }
}
