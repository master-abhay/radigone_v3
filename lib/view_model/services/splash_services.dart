import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../models/user_models/login_user.dart';
import '../user_view_model/save_user_details.dart';
import 'navigation_services.dart';

class SplashServices {
  late NavigationServices _navigationServices;

  SplashServices() {
    final GetIt _getIt = GetIt.instance;
    _navigationServices = _getIt.get<NavigationServices>();
  }

  Future<LoginUserModel> getUserData() => SaveUserDetails().getUser();

  void checkUserAuthentication() async {
    getUserData().then((value) {
      if (value.token.toString() == "null" || value.token.toString() == '') {
        if (kDebugMode) {
          print(
              '------------->>>>>>>>>>>>>>>printing in the SplashServices : ${value.token}');
        }
        Future.delayed(const Duration(seconds: 3));

        _navigationServices.pushReplacementNamed('/loginRegistration');
      } else {
        Future.delayed(const Duration(seconds: 3));

        _navigationServices.pushReplacementNamed('/userMainView');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print((error.toString()));
      }
    });
  }
}
