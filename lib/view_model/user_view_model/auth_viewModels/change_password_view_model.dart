
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:radigone_v3/repositories/user/auth_repository.dart';

import '../../services/alert_services.dart';
import '../../services/flutter_secure_storage/secure_storage.dart';
import '../../services/navigation_services.dart';


class ChangePasswordUserProvider with ChangeNotifier {
  String? _currentPassword, _password, _confirmPassword, _token;
  bool isLoading = false;

  late AlertServices _alertServices;
  late NavigationServices _navigationServices;

  ChangePasswordUserProvider() {
    final GetIt _getIt = GetIt.instance;

    _alertServices = _getIt.get<AlertServices>();
    _navigationServices = _getIt.get<NavigationServices>();
  }

  setLoading(bool val){
    isLoading = val;
    notifyListeners();
  }

  setCurrentPassword(String element) {
    _currentPassword = element;
    notifyListeners();
    print('----------currentPassword: $_currentPassword');
  }

  setPassword(String element) {
    _password = element;
    notifyListeners();
    print('----------Password: $_password');
  }

  setConfirmPassword(String element) {
    _confirmPassword = element;
    notifyListeners();
    print('----------confirmPassword: $_confirmPassword');
  }

  setToken() async {
    _token = await SecureStorage().readSecureData('token');
    notifyListeners();
    print('Token value fetched: $_token');
  }

  final _myRepo = UserAuthRepository();

  Future<void> changePassword(BuildContext context) async {

    setLoading(true);

    // Ensure token is set
    if (_token == null || _token!.isEmpty) {
      print('Token is null or empty');
      _alertServices.flushBarErrorMessages('Authentication token is missing.',context);
      return;
    }

    if(_confirmPassword != _password){

      _alertServices.flushBarErrorMessages('Password and Confirm password is different.',context);
      setLoading(false);
      return;

    }

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': _token!,
    };

    var body = jsonEncode({
      'current_password': _currentPassword ?? '',
      'password': _password ?? '',
      'password_confirmation': _confirmPassword ?? '',
    });


    if (kDebugMode) {
      print('Headers: $headers');
      print('Body: $body');
    }


    _myRepo.userChangePasswordApi(headers: headers,body:  body).then((value) {
      setLoading(false);
      _navigationServices.goBack();
      _alertServices.flushBarErrorMessages("Password Changed Successfully",context);
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
      setLoading(false);
      _alertServices.flushBarErrorMessages(error.toString(), context);
    });

  }
}

