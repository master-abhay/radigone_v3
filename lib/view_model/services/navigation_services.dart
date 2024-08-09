import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:radigone_v3/view/agent_view/agent_authentication/agent_registration_view.dart';
import 'package:radigone_v3/view/sponsor_view/profile/sponser_profile_view.dart';
import 'package:radigone_v3/view/user_view/user_main_view_with_bottomBar_view.dart';

import '../../view/agent_view/agent_main_view_with_bottom_bar.dart';
import '../../view/agent_view/side_menu_bar_view/agent_earning_view.dart';
import '../../view/agent_view/side_menu_bar_view/agent_referral_view.dart';
import '../../view/common_view/login_registration_view.dart';
import '../../view/common_view/select_login_view.dart';
import '../../view/common_view/select_registration_view.dart';
import '../../view/common_view/splash_view.dart';
import '../../view/common_view/video_player_view.dart';
import '../../view/sponsor_view/history/sponsor_history_view.dart';
import '../../view/sponsor_view/profile/sponsor_profile_update_view.dart';
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
import '../../view/sponsor_view/sponser_Authentication/company_registration_form_view.dart';
import '../../view/sponsor_view/sponsor_main_screens_with_bottom_bar.dart';
import '../../view/user_view/profile/profile_edit_page.dart';
import '../../view/user_view/profile/profile_page.dart';
import '../../view/user_view/side_menu_bar_views/ad_preferences_view.dart';
import '../../view/user_view/side_menu_bar_views/close_reply_ticket_view.dart';
import '../../view/user_view/side_menu_bar_views/create_ticket_view.dart';
import '../../view/user_view/side_menu_bar_views/my_tickets_view.dart';
import '../../view/user_view/side_menu_bar_views/redeem_radigone_points_view.dart';
import '../../view/user_view/side_menu_bar_views/transaction_view.dart';
import '../../view/common_view/change_password_view.dart';
import '../../view/common_view/forgot_password_view(enter email).dart';
import '../../view/common_view/login_view.dart';
import '../../view/common_view/forgot_password_otp_verification_view.dart';
import '../../view/user_view/user_authentication_view/viewer_registration_view.dart';
import '../../view/common_view/forgot_password_reset_password_view.dart';

class NavigationServices {
//Creating the global key for navigation State:
  late GlobalKey<NavigatorState> _navigationStateKey;

  NavigationServices() {
    _navigationStateKey = GlobalKey<NavigatorState>();
  }

  GlobalKey<NavigatorState> get navigationStateKey => _navigationStateKey;

  //Creating Routes for the application:
  final Map<String, Widget Function(BuildContext context)> _routes = {




    "/agentRegistrationView": (context) => const AgentRegistrationView(),
    "/sponsorProfileUpdateView": (context) => const SponsorProfileUpdateView(),
    "/agentReferralView": (context) => const AgentReferralView(),
    "/agentEarningView": (context) => const AgentEarningView(),
    "/sponsorCalendarView": (context) => const SponsorCalendarView(),
    // "/sponsorMyTicketsView": (context) => const SponsorMyTicketsView(),
    "/sponsorCreateTicketView": (context) => const SponsorCreateTicketView(),
    "/sponsorSidebarProfileView": (context) => const SponsorSidebarProfileView(),
    "/sponsorProfileView": (context) => const SponsorProfileView(),
    "/sponsorTransactionView": (context) => const SponsorTransactionView(),
    "/sponsorHistoryView": (context) => const SponsorHistoryView(),
    "/sponsorReportView": (context) => const SponsorReportView(),
    "/sponsorDepositLogView": (context) => const SponsorDepositLogView(),
    "/sponsorBuyViewView": (context) => const SponsorBuyViewView(),
    "/sponsorDepositNowView": (context) => const SponsorDepositNowView(),
    "/agentMainView": (context) => const AgentMainView(),
    "/adsPreferencesView": (context) => const AdsPreferencesView(),
    "/myTicketView": (context) => const MyTicketsView(),
    "/createTicketView": (context) => const CreateTicketView(),
    "/userProfilePage": (context) => const ProfilePage(),
    "/transactionView": (context) => const TransactionView(),
    "/redeemRadigonePoints": (context) => const RedeemRadigonePoints(),
    "/changePassword": (context) => const ChangePassword(),
    "/profileEditPage": (context) => const ProfileEditPage(),
    "/videoPlayerPage": (context) =>  VideoPlayerPage(),
    "/selectRegistrationPage": (context) => const SelectRegistrationPage(),
    // "/sponsorRegistrationView":(context)=> const SponsorRegistrationView(),
    "/selectLoginPage" : (context) =>  const SelectLoginPage(),
    "/sponsorMainView" : (context) => const SponsorMainView(),
    "/userMainView": (context) => const UserMainView(),
    // "/forgotPassword": (context) => const ForgotPassword(),
    // "/loginPage": (context) => const LoginPage(),
    "/registrationPage": (context) => const ViewerRegistrationView(),
    "/loginRegistration": (context) => const LoginRegistration(),
    "/splashScreen": (context) => const SplashScreen(),
    // "/home": (context) => const HomePage(),
  };

  //Creating getter to the routes of the application:

  Map<String, Widget Function(BuildContext context)> get routes => _routes;

  void push(MaterialPageRoute route) {
    _navigationStateKey.currentState?.push(route);
  }

  void pushSimpleWithAnimationRoute(Route route) {
    _navigationStateKey.currentState?.push(route);
  }


  void pushCupertino(CupertinoPageRoute route) {
    _navigationStateKey.currentState?.push(route);
  }

  void pushReplacementCupertino(CupertinoPageRoute route) {
    _navigationStateKey.currentState?.pushReplacement(route);
  }

  void pushNamed(String route) {
    _navigationStateKey.currentState?.pushNamed(route);
  }

  void pushReplacementNamed(String route) {
    _navigationStateKey.currentState?.pushReplacementNamed(route);
  }

  void goBack() {
    _navigationStateKey.currentState?.pop();
  }
}
