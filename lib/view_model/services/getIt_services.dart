import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/view_model/services/auth_services.dart';
import 'package:radigone_v3/view_model/services/shared_preferences_data_services/sponser_localDataSaver_shatedPreferences.dart';
import 'package:radigone_v3/view_model/services/shared_preferences_data_services/user_localDataSaver_sharedPreferences.dart';

import 'alert_services.dart';
import 'media_services.dart';
import 'navigation_services.dart';

Future<bool> registerServices() async {
  if (kDebugMode) {
    print(
        "Inside the Register services function in the utils.dart------------>>>>>>>>>Registering getIt services");
  }

  final GetIt getIt = GetIt.instance;

  try {
    // getIt.registerSingleton(UserLocalDataSaverSharedPreferences());
    // if (kDebugMode) {
    //   print(
    //       "------------------------>>>>>>>>>>>>UserLocalDataSaverSharedPreferences Service Registered");
    // }
    //
    // getIt.registerSingleton(SponsorLocalDataSaverSharedPreferences());
    // if (kDebugMode) {
    //   print(
    //       "------------------------>>>>>>>>>>>>SponserLocalDataSaverSharedPreferences Service Registered");
    // }

    getIt.registerSingleton<AuthService>(AuthService());


    getIt.registerSingleton<NavigationServices>(NavigationServices());
    if (kDebugMode) {
      print("-------------------------------Navigation services Registered");
    }

    getIt.registerSingleton<AlertServices>(AlertServices());
    if (kDebugMode) {
      print("-------------------------------AlertServices Registered");
    }

    getIt.registerSingleton<MediaServices>(MediaServices());
    if (kDebugMode) {
      print("-------------------------------MediaServies Registered");
    }

    return true;
  } catch (e) {
    if (kDebugMode) {
      print("Something wrong while Registering Services... error found is $e");
    }
    return false;
  }
}
