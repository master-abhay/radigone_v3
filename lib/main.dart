// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/view/common_view/video_player_view.dart';
import 'package:radigone_v3/view_model/agent_view_model/agent_authentication_viewModels/agent_login_viewModel.dart';

import 'package:radigone_v3/view_model/services/getIt_services.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_login_view_model.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_register_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/change_password_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/dashboard_ads_list_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/login_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/logout_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/profile_update_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/profile_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/radigonePoint_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/save_user_details.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/ads_preferences_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/close_reply_ticket_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/create_ticket_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/my_tickets_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/redeem_radigonePoints_viewModel.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/transaction_viewModel.dart';
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
    print("In main file:---------------->>>>>>>>>>>>>>>>>> All Services Registered Successfully");
  } else {
    print(
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
        // ChangeNotifierProvider(create: (_) => SaveUserDetails()),
        ChangeNotifierProvider(create: (_) => LogoutUserProvider()),
        ChangeNotifierProvider(create: (_) => LoginSponsorProvider()),
        // ChangeNotifierProvider(create: (_) => SaveSponsorDetails()),
        // ChangeNotifierProvider(create: (_) => LogOutSponserProvider()),
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















      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme:
          GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: _navigationServices.navigationStateKey,
        routes: _navigationServices.routes,
        // home: const VideoPlayerPage(),
        // home: CustomBottomNavigationBar(),
        // initialRoute: "/splashScreen",
        initialRoute: "/splashScreen",
      ),
    );
  }
}
