import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/view_model/services/splash_services.dart';

import '../../resources/colors.dart';
import '../../view_model/services/navigation_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late NavigationServices _navigationServices;


  final GetIt _getIt = GetIt.instance;

  //checking the state of the user:
  // String? isUserLogged;
  //
  // Future<void> getUserSharedData() async {
  //   isUserLogged =
  //       await _userLocalDataSaverSharedPreferences.getUserToken();
  //   print('---------------->>>>>>>>>>>>in SplashView$isUserLogged');
  //
  //   print(
  //       "-------Printing the user State=======>>>>>>>>> ${isUserLogged.toString()}");
  // }


  SplashServices _splashServices = SplashServices();
  @override
  void initState() {

    _navigationServices = _getIt.get<NavigationServices>();

    super.initState();

    _splashServices.checkUserAuthentication();

    // getUserSharedData().then((value) => Future.delayed(const Duration(seconds: 2))
    //     .then((value) => (isUserLogged != null && isUserLogged != '')
    //         ? _navigationServices.pushReplacementNamed('/userMainView')
    //
    //     : _navigationServices.pushReplacementNamed('/loginRegistration')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  MyColorScheme.lightGrey1.withOpacity(0.7),
                  MyColorScheme.lightGrey0,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.1, 0.6])),
        child: Center(
          child: Image.asset("images/splash_logo.png"),
        ),
      ),
    );
  }
}
