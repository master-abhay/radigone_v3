import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/data/response/ApiResponse.dart';
import 'package:radigone_v3/models/user_models/user_radigone_point-model.dart';
import 'package:radigone_v3/repositories/user/home_repository.dart';

import '../services/alert_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';

class UserRadigonePointViewModel with ChangeNotifier {
  String? _username;
  String? _password;
  String? _token;

  setUsername() async {
    _username = await SecureStorage().readSecureData('username');
  }

  setPassword() async {
    _password = await SecureStorage().readSecureData('password');
  }

  setToken() async {
    _token = await SecureStorage().readSecureData('token');
  }

  late AlertServices _alertServices;

  UserRadigonePointViewModel() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
  }

  final _myRepo = UserHomeRepository();
  ApiResponse<UserRadigonePointModel> userRadigonePointViewModel =
      ApiResponse.loading();

  setUserRadigonePointViewModel(ApiResponse<UserRadigonePointModel> response) {
    userRadigonePointViewModel = response;
    notifyListeners();
  }

  fetchUserRadigonePoint(BuildContext context) async {
    setUserRadigonePointViewModel(ApiResponse.loading());

    await setUsername();
    await setPassword();
    await setToken();




    Map headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": _token!,
      'username': _username!,
      'password': _password!,
    };

    if (_username != null && _password != null) {
      _myRepo.userRadigonePointApi(headers: headers).then((value) {
        setUserRadigonePointViewModel(ApiResponse.completed(value));
      }).onError((error, stackTrace) {

        setUserRadigonePointViewModel(ApiResponse.error(error.toString()));
        _alertServices.showToast(message: error.toString());
      });
    }
  }
}
