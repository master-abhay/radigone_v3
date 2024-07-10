// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get_it/get_it.dart';
// import 'package:radigone_v3/resources/components/constants.dart';
// import 'package:radigone_v3/view/user_view/profile/profile_page.dart';
// import 'package:radigone_v3/view/user_view/user_side_menubar.dart';
// import 'package:radigone_v3/view_model/services/auth_services.dart';
//
// import '../../resources/colors.dart';
// import 'coupons/coupos_page.dart';
// import 'history/history_page.dart';
// import 'home/home_page.dart';
//
// class UserMainView extends StatefulWidget {
//   const UserMainView({super.key});
//
//   @override
//   State<UserMainView> createState() => _UserMainViewState();
// }
//
// class _UserMainViewState extends State<UserMainView> {
//   String? _userName, _userEmail, _userImageLink;
//
//   late AuthService _authService;
//
//   @override
//   void initState() {
//
//     super.initState();
//     final GetIt getIt = GetIt.instance;
//     _authService = getIt.get<AuthService>();
//
//     initializeValues();
//   }
//
//   Future<void> initializeValues() async {
//
//     _userName = await _authService.getUserName();
//     _userEmail = await _authService.getUserEmail();
//     _userImageLink = await _authService.getUserImageLink() ?? PLACEHOLDER_PFP;
//   }
//
//   final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
//
//   bool home = true;
//   bool coupons = false;
//   bool history = false;
//   bool profile = false;
//
//   List<dynamic> screens = [
//     const HomePage(),
//     const CouponsPage(),
//     const HistoryPage(),
//     const ProfilePage()
//   ];
//
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _drawerKey,
//         // drawer: FutureBuilder(
//         //     future: initializeValues(),
//         //     builder: (context, snapshot) {
//         //       if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none){
//         //         return const UserSideBar(
//         //           userName: "Fetching..",
//         //           userEmail: "Fetching..",
//         //           userProfileImageLink: null,
//         //         );
//         //
//         //       }
//         //       if(snapshot.hasError){
//         //         print(snapshot.error.toString());
//         //         return const UserSideBar(
//         //           userName: "Error..",
//         //           userEmail: "Error..",
//         //           userProfileImageLink: null,
//         //         );
//         //       }
//         //       return  UserSideBar(
//         //         userName: 'Hi $_userName',
//         //         userEmail: _userEmail,
//         //         // userProfileImageLink: _userImageLink,
//         //       );
//         //     }),
//         bottomNavigationBar: Container(
//
//           height: 60,
//           // padding: EdgeInsets.zero,
//           decoration: const BoxDecoration(
//             gradient: MyColorScheme.bottomNavigationBar,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     home = true;
//                     coupons = false;
//                     history = false;
//                     profile = false;
//                   });
//                 },
//                 child: Container(
//                   color: Colors.transparent,
//                   width: MediaQuery.sizeOf(context).width * .25,
//
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(
//                         "images/homeIcon.svg",
//                         color: home ? Colors.yellow : Colors.white,
//                       ),
//                       Text(
//                         "Home",
//                         style: TextStyle(
//                             color: home ? Colors.yellow : Colors.white,
//                             fontSize: 10),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     home = false;
//                     coupons = true;
//                     history = false;
//                     profile = false;
//                   });
//                 },
//                 child: Container(
//                   width: MediaQuery.sizeOf(context).width * .25,
//                   color: Colors.transparent,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(
//                         "images/coupons.svg",
//                         color: coupons ? Colors.yellow : Colors.white,
//                       ),
//                       Text(
//                         "Coupons",
//                         style: TextStyle(
//                             color: coupons ? Colors.yellow : Colors.white,
//                             fontSize: 10),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     home = false;
//                     coupons = false;
//                     history = true;
//                     profile = false;
//                   });
//                 },
//                 child: Container(
//                   color: Colors.transparent,
//                   width: MediaQuery.sizeOf(context).width * .25,
//
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(
//                         "images/history.svg",
//                         color: history ? Colors.yellow : Colors.white,
//                       ),
//                       Text(
//                         "History",
//                         style: TextStyle(
//                             color: history ? Colors.yellow : Colors.white,
//                             fontSize: 10),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     home = false;
//                     coupons = false;
//                     history = false;
//                     profile = true;
//                   });
//                 },
//                 child: Container(
//                   color: Colors.transparent,
//                   width: MediaQuery.sizeOf(context).width * .25,
//
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(
//                         "images/profile.svg",
//                         color: profile ? Colors.yellow : Colors.white,
//                       ),
//                       Text(
//                         "Profile",
//                         style: TextStyle(
//                             color: profile ? Colors.yellow : Colors.white,
//                             fontSize: 10),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: _buildUI());
//   }
//
//   Widget _buildUI() {
//     if (coupons) {
//       return screens[1];
//     }
//     if (history) {
//       return screens[2];
//     }
//     if (profile) {
//       return screens[3];
//     }
//
//     return screens[0];
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/resources/colors.dart';
import 'package:radigone_v3/resources/components/app_bar/custom_app_bar.dart';
import 'package:radigone_v3/view/user_view/profile/profile_page.dart';
import 'package:radigone_v3/view/user_view/user_side_menubar.dart';
import 'package:radigone_v3/view_model/services/auth_services.dart';
import '../../utils/constants.dart';
import 'coupons/coupos_page.dart';
import 'history/history_page.dart';
import 'home/home_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTabSelected;
  final int currentIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onTabSelected,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        gradient: MyColorScheme.bottomNavigationBar,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            index: 0,
            icon: "images/homeIcon.svg",
            label: "Home",
          ),
          _buildNavItem(
            context,
            index: 1,
            icon: "images/coupons.svg",
            label: "Coupons",
          ),
          _buildNavItem(
            context,
            index: 2,
            icon: "images/history.svg",
            label: "History",
          ),
          _buildNavItem(
            context,
            index: 3,
            icon: "images/profile.svg",
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required String icon,
    required String label,
  }) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width * .25,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: isSelected ? Colors.yellow : Colors.white,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.yellow : Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserMainView extends StatefulWidget {
  const UserMainView({super.key});

  @override
  State<UserMainView> createState() => _UserMainViewState();
}

class _UserMainViewState extends State<UserMainView> {
  String? _userName, _userEmail, _userImageLink;

  late AuthService _authService;

  @override
  void initState() {
    super.initState();
    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();
    initializeValues();
  }

  Future<void> initializeValues() async {
    _userName = await _authService.getUserName();
    _userEmail = await _authService.getUserEmail();
    _userImageLink = await _authService.getUserImageLink() ?? Constants.PLACEHOLDER_PFP;
  }

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  List<dynamic> screens = [
    const HomePage(),
    const CouponsPage(),
    const HistoryPage(),
    const ProfilePage()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex == 0
          ? CustomAppBar(
              height: 0,
              openDrawer: () {
                _drawerKey.currentState!.openDrawer();
              })
          : null,
      key: _drawerKey,
      extendBody: true,
      drawer: Drawer(
        child: FutureBuilder(
          future: initializeValues(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return const UserSideBar(
                userName: "Fetching..",
                userEmail: "Fetching..",
                userProfileImageLink: null,
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return const UserSideBar(
                userName: "Error..",
                userEmail: "Error..",
                userProfileImageLink: null,
              );
            }
            return UserSideBar(
              userName: 'Hi $_userName', userEmail: _userEmail,
              // userProfileImageLink: _userImageLink,
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTabSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return screens[currentIndex];
  }
}
