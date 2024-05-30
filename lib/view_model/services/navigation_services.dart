import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:radigone_v3/view/user_view/main_view_with_bottomBar_view.dart';

import '../../view/common_view/login_registration_view.dart';
import '../../view/common_view/select_login_view.dart';
import '../../view/common_view/select_registration_view.dart';
import '../../view/common_view/splash_view.dart';
import '../../view/user_view/profile/profile_edit_page.dart';
import '../../view/user_view/user_authentication_view/change_password_view.dart';
import '../../view/user_view/user_authentication_view/forgot_password_view.dart';
import '../../view/user_view/user_authentication_view/login_view.dart';
import '../../view/user_view/user_authentication_view/otp_verification_view.dart';
import '../../view/user_view/user_authentication_view/registration_view.dart';
import '../../view/user_view/user_authentication_view/reset_password_view.dart';

class NavigationServices {
//Creating the global key for navigation State:
  late GlobalKey<NavigatorState> _navigationStateKey;

  NavigationServices() {
    _navigationStateKey = GlobalKey<NavigatorState>();
  }

  GlobalKey<NavigatorState> get navigationStateKey => _navigationStateKey;

  //Creating Routes for the application:
  final Map<String, Widget Function(BuildContext context)> _routes = {


    // "/changePassword": (context) => const ChangePassword(),
    "/profileEditPage": (context) => const ProfileEditPage(),
    // "/videoPlayerPage": (context) => const VideoPlayerPage(),
    "/selectRegistrationPage": (context) => const SelectRegistrationPage(),
    // "/SponserRegistrationPage":(context)=> const SponserRegistrationPage(),
    "/selectLoginPage" : (context) =>  const SelectLoginPage(),
    // "/sponserLoginPage" : (context) => const SponserLoginPage(),
    // "/sponserMainScreen" : (context) => const SponserMainScreen(),
    "/userMainView": (context) => const UserMainView(),
    // "/resetPassword": (context) => const ResetPassword(),
    // "/forgotPassword": (context) => const ForgotPassword(),
    // "/otpVerification": (context) => OtpVerification(),
    "/loginPage": (context) => const LoginPage(),
    // "/registrationPage": (context) => const RegistrationPage(),
    "/loginRegistration": (context) => const LoginRegistration(),
    "/splashScreen": (context) => const SplashScreen(),
    // "/home": (context) => const HomePage(),
  };

  //Creating getter to the routes of the application:

  Map<String, Widget Function(BuildContext context)> get routes => _routes;

  void push(MaterialPageRoute route) {
    _navigationStateKey.currentState!.push(route);
  }

  void pushNamed(String route) {
    _navigationStateKey.currentState!.pushNamed(route);
  }

  void pushReplacementNamed(String route) {
    _navigationStateKey.currentState!.pushReplacementNamed(route);
  }

  void goBack() {
    _navigationStateKey.currentState!.pop();
  }
}