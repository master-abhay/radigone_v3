import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:radigone_v3/view/user_view/profile/profile_page.dart';
import 'package:radigone_v3/view/user_view/user_side_menubar.dart';

import '../../resources/colors.dart';
import 'coupons/coupos_page.dart';
import 'history/history_page.dart';
import 'home/home_page.dart';

class UserMainView extends StatefulWidget {
  const UserMainView({super.key});

  @override
  State<UserMainView> createState() => _UserMainViewState();
}

class _UserMainViewState extends State<UserMainView> {

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  bool home = true;
  bool coupons = false;
  bool history = false;
  bool profile = false;

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
      key: _drawerKey,
        drawer: const UserSideBar(userName: "Afhjfkshfkdsfdsuhfskjfhsfhs",),
        bottomNavigationBar: Container(
          height: 60,
          // padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
            gradient: MyColorScheme.bottomNavigationBar,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisSize: MainAxisSize.max,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    home = true;
                    coupons = false;
                    history = false;
                    profile = false;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "images/homeIcon.svg",
                      color: home ? Colors.yellow : Colors.white,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          color: home ? Colors.yellow : Colors.white,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    home = false;
                    coupons = true;
                    history = false;
                    profile = false;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "images/coupons.svg",
                      color: coupons ? Colors.yellow : Colors.white,
                    ),
                    Text(
                      "Coupons",
                      style: TextStyle(
                          color: coupons ? Colors.yellow : Colors.white,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    home = false;
                    coupons = false;
                    history = true;
                    profile = false;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "images/history.svg",
                      color: history ? Colors.yellow : Colors.white,
                    ),
                    Text(
                      "History",
                      style: TextStyle(
                          color: history ? Colors.yellow : Colors.white,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    home = false;
                    coupons = false;
                    history = false;
                    profile = true;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "images/profile.svg",
                      color: profile ? Colors.yellow : Colors.white,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: profile ? Colors.yellow : Colors.white,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: _buildUI());
  }

  Widget _buildUI() {
    if (coupons) {
      return screens[1];
    }
    if (history) {
      return screens[2];
    }
    if (profile) {
      return screens[3];
    }

    return screens[0];
  }
}
