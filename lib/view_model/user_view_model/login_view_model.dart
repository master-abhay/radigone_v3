// Creating the services with the help of the state management using the providerState management:

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/models/user_models/login_user.dart';
import 'package:radigone_v3/view_model/user_view_model/save_user_details.dart';

import '../../repositories/user/auth_repository.dart';
import '../services/alert_services.dart';
import '../services/flutter_secure_storage/secure_storage.dart';
import '../services/navigation_services.dart';
import '../services/shared_preferences_data_services/user_localDataSaver_sharedPreferences.dart';

class LoginUserProvider with ChangeNotifier {
  String? _username;
  String? _password;

  void setUsername(String? username) {
    if (username != null && username.isNotEmpty) {
      _username = username;
      print("username set..");
      notifyListeners();
    }
  }

  void setPassword(String? password) {
    if (password != null && password.isNotEmpty) {
      _password = password;
      print("password set..");
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
  late UserLocalDataSaverSharedPreferences _userLocalDataSaverSharedPreferences;
  late NavigationServices _navigationServices;

  LoginUserProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _userLocalDataSaverSharedPreferences =
        getIt.get<UserLocalDataSaverSharedPreferences>();
    _navigationServices = getIt.get<NavigationServices>();
  }

  //Creating a object which can take care of data of profile as usual for now we need only token and token type to implement the logout functionality:

  final _myRepo = UserAuthRepository();

  // Now of No Use:
  Future<void> saveDetails(dynamic value) async {
    // print("printing in the save detatil:    ${value['token']}");
    // await _userLocalDataSaverSharedPreferences.setUserToken(value['token']);
    //
    // String? tokenResult = await _userLocalDataSaverSharedPreferences.getUserToken();
    // print("--------Printing from latest:  $tokenResult");

    // Saving the user password in secure storage to login dashboard
    await SecureStorage().writeSecureData('username', _username!);
    await SecureStorage().writeSecureData('password', _password!);
    await SecureStorage()
        .writeSecureData('token', '${value['token_type']} ${value['token']}');
    await SecureStorage()
        .writeSecureData('mobile', '${value['data']['mobile']}');

    if (kDebugMode) {
      print(await SecureStorage().readSecureData('username'));
      print(await SecureStorage().readSecureData('password'));
      print(await SecureStorage().readSecureData('token'));
      print(await SecureStorage().readSecureData('mobile'));
    }
  }

  Future<bool> loginUser(BuildContext context) async {
    setLoading(true);

    Map data = {"username": _username, "password": _password};

    _myRepo.userLoginApi(data).then((value) {
      saveDetails(value);
      final provider = Provider.of<SaveUserDetails>(context, listen: false);

      if (kDebugMode) {
        print(value.toString());
        print('---------printing from Ligin model: ${value['token']}');
      }
      provider.saveUser(LoginUserModel(
          token: value['token'], tokenType: value['token_type']));
      saveDetails(value);

      _navigationServices.goBack();
      _navigationServices.pushReplacementNamed('/userMainView');
      _alertServices.flushBarErrorMessages("Login Successfully", context);

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
