import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:radigone_v3/view/sponsor_view/profile/sponser_profile_view.dart';
import 'package:radigone_v3/view/user_view/main_view_with_bottomBar_view.dart';

import '../../view/agent_view/agent_authentication/agent_login_view.dart';
import '../../view/agent_view/agent_main_view_with_bottom_bar.dart';
import '../../view/common_view/login_registration_view.dart';
import '../../view/common_view/select_login_view.dart';
import '../../view/common_view/select_registration_view.dart';
import '../../view/common_view/splash_view.dart';
import '../../view/sponsor_view/history/sponsor_history_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_buyView_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_calendar_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_close_reply_ticket_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_create_ticket_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_deposit_log_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_deposit_now_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_myTickets_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_report_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_sidebar_profile_view.dart';
import '../../view/sponsor_view/side_menu_bar_view/sponsor_transaction_view.dart';
import '../../view/sponsor_view/sponser_Authentication/sponsor_change_password_view.dart';
import '../../view/sponsor_view/sponser_Authentication/sponsor_login_view.dart';
import '../../view/sponsor_view/sponser_Authentication/sponsor_registration_view.dart';
import '../../view/sponsor_view/sponsor_main_screens_with_bottom_bar.dart';
import '../../view/user_view/profile/profile_edit_page.dart';
import '../../view/user_view/profile/profile_page.dart';
import '../../view/user_view/side_menu_bar_views/ad_preferences_view.dart';
import '../../view/user_view/side_menu_bar_views/close_reply_ticket_view.dart';
import '../../view/user_view/side_menu_bar_views/create_ticket_view.dart';
import '../../view/user_view/side_menu_bar_views/my_tickets_view.dart';
import '../../view/user_view/side_menu_bar_views/redeem_radigone_points_view.dart';
import '../../view/user_view/side_menu_bar_views/transaction_view.dart';
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





    "/sponsorCalendarView": (context) => const SponsorCalendarView(),
    "/sponsorChangePasswordView": (context) => const SponsorChangePasswordView(),
    "/sponsorMyTicketsView": (context) => const SponsorMyTicketsView(),
    "/sponsorCreateTicketView": (context) => const SponsorCreateTicketView(),
    "/sponsorSidebarProfileView": (context) => const SponsorSidebarProfileView(),
    "/sponsorProfileView": (context) => const SponsorProfileView(),
    "/sponsorTransactionView": (context) => const SponsorTransactionView(),
    "/sponsorHistoryView": (context) => const SponsorHistoryView(),
    "/sponsorReportView": (context) => const SponsorReportView(),
    "/sponsorDepositLogView": (context) => const SponsorDepositLogView(),
    "/sponsorBuyViewView": (context) => const SponsorBuyViewView(),
    "/sponsorDepositNowView": (context) => const SponsorDepositNowView(),
    "/agentLoginView": (context) => const AgentLoginView(),
    "/agentMainView": (context) => const AgentMainView(),
    "/adsPreferencesView": (context) => const AdsPreferencesView(),
    "/myTicketView": (context) => const MyTicketsView(),
    "/createTicketView": (context) => const CreateTicketView(),
    "/userProfilePage": (context) => const ProfilePage(),
    "/transactionView": (context) => const TransactionView(),
    "/redeemRadigonePoints": (context) => const RedeemRadigonePoints(),
    "/changePassword": (context) => const ChangePassword(),
    "/profileEditPage": (context) => const ProfileEditPage(),
    // "/videoPlayerPage": (context) => const VideoPlayerPage(),
    "/selectRegistrationPage": (context) => const SelectRegistrationPage(),
    "/SponserRegistrationPage":(context)=> const SponsorRegistrationView(),
    "/selectLoginPage" : (context) =>  const SelectLoginPage(),
    "/sponsorLoginPage" : (context) => const SponsorLoginView(),
    "/sponsorMainView" : (context) => const SponsorMainScreen(),
    "/userMainView": (context) => const UserMainView(),
    // "/resetPassword": (context) => const ResetPassword(),
    // "/forgotPassword": (context) => const ForgotPassword(),
    // "/otpVerification": (context) => OtpVerification(),
    "/loginPage": (context) => const LoginPage(),
    "/registrationPage": (context) => const RegistrationPage(),
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
