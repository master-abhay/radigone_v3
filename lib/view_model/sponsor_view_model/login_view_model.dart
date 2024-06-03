// Creating the services with the help of the state management using the providerState management:

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/models/sponsor_models/login_sponsor_model.dart';

import '../../repositories/sponsor/auth_repository.dart';
import '../services/alert_services.dart';
import '../services/auth_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';
import '../services/navigation_services.dart';

class LoginSponsorProvider with ChangeNotifier {
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

  LoginSponsorProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _navigationServices = getIt.get<NavigationServices>();
    _authService = getIt.get<AuthService>();
  }

  Future<void> saveDetails(LoginSponsorModel value) async {
    await SecureStorage().writeSecureData('username', _username!);
    await SecureStorage().writeSecureData('password', _password!);
    await SecureStorage()
        .writeSecureData('token', '${value.tokenType} ${value.token}');
    await SecureStorage()
        .writeSecureData('mobile', value.data!.mobile.toString());
    await SecureStorage().writeSecureData('id', value.data!.id.toString());
    //Saving token in sharedPreferences:
    await _authService.saveSponsorToken(
        '${value.tokenType.toString()} ${value.token.toString()}');

    if (kDebugMode) {
      print(await SecureStorage().readSecureData('username'));
      print(await SecureStorage().readSecureData('password'));
      print(await SecureStorage().readSecureData('token'));
      print(await SecureStorage().readSecureData('mobile'));
      print(await SecureStorage().readSecureData('id'));
    }
  }

  final _myRepo = SponsorAuthRepository();

  Future<bool> loginSponsor(BuildContext context) async {
    setLoading(true);

    Map body = {"username": _username, "password": _password};

    _myRepo.sponsorLoginApi(body: body).then((value) {
      saveDetails(value);

      _navigationServices.goBack();
      _navigationServices.pushReplacementNamed('/sponsorMainView');
      if (kDebugMode) {
        print("Sponsor logged in Successfully");
      }

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
