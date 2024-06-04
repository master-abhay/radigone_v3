// Creating the services with the help of the state management using the providerState management:

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../repositories/user/auth_repository.dart';
import '../services/alert_services.dart';
import '../services/auth_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';
import '../services/navigation_services.dart';

class LoginUserProvider with ChangeNotifier {
  String? _username;
  String? _password;

  void setUsername(String? username) {
    if (username != null && username.isNotEmpty) {
      _username = username;
      if (kDebugMode) {
        print("username set..");
      }
      notifyListeners();
    }
  }

  void setPassword(String? password) {
    if (password != null && password.isNotEmpty) {
      _password = password;
      if (kDebugMode) {
        print("password set..");
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

  LoginUserProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _authService = getIt.get<AuthService>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  Future<void> saveDetails(dynamic value) async {
    // Saving the user password in secure storage to login dashboard
    await SecureStorage().writeSecureData('username', _username!);
    await SecureStorage().writeSecureData('password', _password!);
    await SecureStorage()
        .writeSecureData('token', '${value['token_type']} ${value['token']}');
    await SecureStorage()
        .writeSecureData('mobile', '${value['data']['mobile']}');
    await SecureStorage().writeSecureData('id', '${value['data']['id']}');

    //Saving token in sharedPreferences:
    await _authService
        .saveUserToken('${value['token_type']} ${value['token']}');
    await _authService.saveUserName(
        '${value['data']['firstname']} ${value['data']['lastname']}');
    await _authService.saveUserEmail('${value['data']['email']}');
    await _authService.saveUserImageLink('${value['data']['image']}');

    if (kDebugMode) {
      print(await SecureStorage().readSecureData('username'));
      print(await SecureStorage().readSecureData('password'));
      print(await SecureStorage().readSecureData('token'));
      print(await SecureStorage().readSecureData('mobile'));
      print(await SecureStorage().readSecureData('id'));
    }
  }

  final _myRepo = UserAuthRepository();

  Future<bool> loginUser(BuildContext context) async {
    setLoading(true);

    Map data = {"username": _username, "password": _password};

    _myRepo.userLoginApi(data).then((value) {
      saveDetails(value);
      _navigationServices.goBack();
      _navigationServices.pushReplacementNamed('/userMainView');
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
