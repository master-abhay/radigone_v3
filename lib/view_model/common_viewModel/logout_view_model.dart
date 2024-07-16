import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/repositories/common/common_repository.dart';
import 'package:radigone_v3/view_model/services/flutter_secure_storage/secure_storage.dart';

import '../services/alert_services.dart';
import '../services/auth_services.dart';
import '../services/navigation_services.dart';

class LogoutProvider with ChangeNotifier {
  late AlertServices _alertServices;
  late NavigationServices _navigationServices;

  late AuthService _authService;

  LogoutProvider() {
    final GetIt getIt = GetIt.instance;
    _alertServices = getIt.get<AlertServices>();
    _authService = getIt.get<AuthService>();

    _navigationServices = getIt.get<NavigationServices>();
  }

  Future<void> deleteUserDetails() async {
    if (kDebugMode) {
      print("Deleting the user Details by Logout");
    }
    await _authService.clearAllUserData();

    //Deleting full data from SecureStorage
    await SecureStorage().deleteAllSecureData();
    await SecureStorage().deleteSecureData('username');
    await SecureStorage().deleteSecureData('password');
    await SecureStorage().deleteSecureData('token');
    await SecureStorage().deleteSecureData('id');
    // LoginUserModel() = LoginUserModel();
  }

  final _myRepo = CommonRepository();

  Future<bool> logOut(BuildContext context, {required String token}) async {
    Map header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": token ?? ''
    };

    _myRepo.logoutApi(headers: header, body: null).then((value) {
      deleteUserDetails();
      _navigationServices.goBack();
      _navigationServices.pushReplacementNamed('/loginRegistration');
      _alertServices.flushBarErrorMessages("Logout Successfully", context);
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
      _alertServices.flushBarErrorMessages(error.toString(), context);
    });

    return true;
  }
}
