// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get_it/get_it.dart';
// import 'package:path/path.dart';
// import 'package:radigone_v3/view_model/services/shared_preferences_data_services/sponser_localDataSaver_shatedPreferences.dart';
// import 'package:radigone_v3/view_model/services/shared_preferences_data_services/user_localDataSaver_sharedPreferences.dart';
//
// import '../../models/user_models/login_user.dart';
// import '../user_view_model/save_user_details.dart';
// import 'navigation_services.dart';
//
// class SplashServices {
//   late NavigationServices _navigationServices;
//   late UserLocalDataSaverSharedPreferences _userLocalDataSaverSharedPreferences;
//   late SponsorLocalDataSaverSharedPreferences _sponsorLocalDataSaverSharedPreferences;
//
//   SplashServices() {
//     final GetIt _getIt = GetIt.instance;
//     _navigationServices = _getIt.get<NavigationServices>();
//     _userLocalDataSaverSharedPreferences = _getIt.get<UserLocalDataSaverSharedPreferences>();
//     _sponsorLocalDataSaverSharedPreferences = _getIt.get<SponsorLocalDataSaverSharedPreferences>();
//
//   }
//
//   // Future<LoginUserModel> getUserData() => SaveUserDetails().getUser();
//
//
//
//   Future initializeTokens() async{
//
// }
//
//   void checkUserAuthentication() async {
//     // getUserData().then((value) {
//     //   if (value.token.toString() == "null" || value.token.toString() == '') {
//     //     if (kDebugMode) {
//     //       print(
//     //           '------------->>>>>>>>>>>>>>>printing in the SplashServices : ${value.token}');
//     //     }
//     //     Future.delayed(const Duration(seconds: 3));
//     //
//     //     _navigationServices.pushReplacementNamed('/loginRegistration');
//     //   } else {
//     //     Future.delayed(const Duration(seconds: 3));
//     //
//     //     _navigationServices.pushReplacementNamed('/userMainView');
//     //   }
//     // }
//     //
//     //
//     // ).onError((error, stackTrace) {
//     //   if (kDebugMode) {
//     //     print((error.toString()));
//     //   }
//     // });
//
//
//     final sponsorToken = await _sponsorLocalDataSaverSharedPreferences.getSponsorToken();
//    final  userToken = await _userLocalDataSaverSharedPreferences.getUserToken();
//    final agentToken = '';
//
//    print(sponsorToken);
//    print(userToken);
//
//     if (userToken != null && userToken.isNotEmpty) {
//       _navigationServices.pushReplacementNamed('/userMainView');
//     } else if (sponsorToken != null && sponsorToken.isNotEmpty) {
//       _navigationServices.pushReplacementNamed('/sponsorMainView');
//     } else if (agentToken != null && agentToken.isNotEmpty) {
//       _navigationServices.pushReplacementNamed('/agentMainView');
//     } else {
//       _navigationServices.pushReplacementNamed('/loginRegistration');
//     }
//
//
//   }
//
//
//
//   }
//
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../view/sponsor_view/sponsor_main_screens_with_bottom_bar.dart';
import 'auth_services.dart';
import 'navigation_services.dart';

class SplashServices {
  late NavigationServices _navigationServices;
  late AuthService _authService;

  SplashServices() {
    final GetIt _getIt = GetIt.instance;
    _navigationServices = _getIt.get<NavigationServices>();
    _authService = _getIt.get<AuthService>();
  }

  Future<void> checkUserAuthentication() async {
    final userToken = await _authService.getUserToken();
    final sponsorToken = await _authService.getSponsorToken();
    final agentToken = await _authService.getAgentToken();

    if (userToken != null && userToken.isNotEmpty) {
      _navigationServices.pushReplacementNamed('/userMainView');
    } else if (sponsorToken != null && sponsorToken.isNotEmpty) {
      _navigationServices.pushReplacementNamed('/sponsorMainView');
      // _navigationServices.goBack();
      // _navigationServices.push(MaterialPageRoute(builder: (context)=>const SponsorMainScreen(sponsorHome: true, sponsorDeposit: false, sponsorHistory: false, sponsorProfile: false)));

    } else if (agentToken != null && agentToken.isNotEmpty) {
      _navigationServices.pushReplacementNamed('/agentMainView');
    } else {
      _navigationServices.pushReplacementNamed('/loginRegistration');
    }
  }
}

