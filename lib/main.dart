import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/tester.dart';
import 'package:radigone_v3/view/sponsor_view/side_menu_bar_view/sponsor_deposit_now_view.dart';
import 'package:radigone_v3/view_model/agent_view_model/agent_auth_viewModels/agent_login_viewModel.dart';
import 'package:radigone_v3/view_model/agent_view_model/agent_referralLink_viewModel.dart';
import 'package:radigone_v3/view_model/common_viewModel/change_password_view_model.dart';
import 'package:radigone_v3/view_model/common_viewModel/logout_view_model.dart';
import 'package:radigone_v3/view_model/common_viewModel/registration_fees_viewModel.dart';
import 'package:radigone_v3/view_model/services/getIt_services.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_auth_viewModel/sponsor_login_view_model.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_profile_information_viewModel.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_register_viewModel.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_close_reply_ticket_viewModel.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_create_ticket_viewModel.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_deposit_viewModel.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_myTickets_viewModel.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_profile_update_viewModel.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_transaction_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/dashboard_ads_list_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/profile_update_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/profile_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/radigonePoint_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/ads_preferences_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/close_reply_ticket_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/create_ticket_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/my_tickets_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/redeem_radigonePoints_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/transaction_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/user_auth_viewModels/login_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/user_points_view_model.dart';

Future<void> main() async {
  // Locks the app in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await setup();
  runApp(MyApp());
}

// setting the things which are pre-required:
Future<void> setup() async {
  bool isRegistered = await registerServices();
  if (isRegistered) {
    debugPrint(
        "In main file:---------------->>>>>>>>>>>>>>>>>> All Services Registered Successfully");
  } else {
    debugPrint(
        "In main file:---------------->>>>>>>>>>>>>>>>>>Services not Registered");
  }
}

late NavigationServices _navigationServices;

class MyApp extends StatefulWidget {
  MyApp({super.key}) {
    final GetIt getIt = GetIt.instance;

    _navigationServices = getIt.get<NavigationServices>();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginUserProvider()),
        ChangeNotifierProvider(create: (_) => LogoutProvider()),
        ChangeNotifierProvider(create: (_) => LoginSponsorProvider()),
        ChangeNotifierProvider(create: (_) => RegisterSponsorProvider()),
        ChangeNotifierProvider(create: (_) => DashboardUserProvider()),
        ChangeNotifierProvider(create: (_) => UserRadigonePointViewModel()),
        ChangeNotifierProvider(create: (_) => UserPointsViewModel()),
        ChangeNotifierProvider(create: (_) => UserProfileInformationProvider()),
        ChangeNotifierProvider(create: (_) => UserprofileUpdateProvider()),
        ChangeNotifierProvider(create: (_) => ChangePasswordUserProvider()),
        ChangeNotifierProvider(create: (_) => RedeemRadigonePointsViewModel()),
        ChangeNotifierProvider(create: (_) => TransactionViewModel()),
        ChangeNotifierProvider(create: (_) => CreateTicketViewModel()),
        ChangeNotifierProvider(create: (_) => MyTicketsViewModel()),
        ChangeNotifierProvider(create: (_) => CloseReplyTicketViewmodel()),
        ChangeNotifierProvider(create: (_) => UserAdsPreferencesViewModel()),
        ChangeNotifierProvider(create: (_) => AgentLoginViewModel()),
        ChangeNotifierProvider(create: (_) => SponsorProfileInformationViewModel()),
        ChangeNotifierProvider(create: (_) => SponsorDepositViewModel()),
        ChangeNotifierProvider(create: (_) => SponsorHistoryViewModel()),
        ChangeNotifierProvider(create: (_) => SponsorCreateTicketViewModel()),
        ChangeNotifierProvider(create: (_) => SponsorMyTicketsViewModel()),
        ChangeNotifierProvider(create: (_) => SponsorCloseReplyTicketViewModel()),
        ChangeNotifierProvider(create: (_) => AgentReferralLinkViewModel()),
        ChangeNotifierProvider(create: (_) => SponsorProfileUpdateViewModel()),
        ChangeNotifierProvider(create: (_) => FetchSponsorInformation()),
        ChangeNotifierProvider(create: (_) => RegistrationFeesViewModel()),

      ],
      child: MaterialApp(
        title: 'Radigone',
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: _navigationServices.navigationStateKey,
        routes: _navigationServices.routes,
        // home:  (),
        initialRoute: "/splashScreen",
      ),
    );
  }
}
