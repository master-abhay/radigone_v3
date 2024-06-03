import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:radigone_v3/view/sponsor_view/profile/sponser_profile.dart';
import 'package:radigone_v3/view/sponsor_view/sponser_side_menubar.dart';

import '../../resources/colors.dart';
import 'deposit/sponser_deposit.dart';
import 'history/sponser_history.dart';
import 'home/sponser_home.dart';


class SponsorMainScreen extends StatefulWidget {
  const SponsorMainScreen({super.key});

  @override
  State<SponsorMainScreen> createState() => _SponsorMainScreenState();
}

class _SponsorMainScreenState extends State<SponsorMainScreen> {

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  bool _sponsorHome = true;
  bool _sponsorDeposit = false;
  bool _sponsorHistory = false;
  bool _sponsorProfile = false;

  List<dynamic> screens = [
    const SponserHome(),
    const SponserDeposit(),
    const SponserHistory(),
    const SponserProfile()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer: const SponserSideBar(),
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
                    _sponsorHome = true;
                    _sponsorDeposit = false;
                    _sponsorHistory = false;
                    _sponsorProfile = false;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width*.25,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "images/homeIcon.svg",
                        color: _sponsorHome ? Colors.yellow : Colors.white,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: _sponsorHome ? Colors.yellow : Colors.white,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _sponsorHome = false;
                    _sponsorDeposit = true;
                    _sponsorHistory = false;
                    _sponsorProfile = false;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width*.25,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "images/coupons.svg",
                        color: _sponsorDeposit ? Colors.yellow : Colors.white,
                      ),
                      Text(
                        "Deposit",
                        style: TextStyle(
                            color: _sponsorDeposit ? Colors.yellow : Colors.white,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _sponsorHome = false;
                    _sponsorDeposit = false;
                    _sponsorHistory = true;
                    _sponsorProfile = false;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width*.25,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "images/history.svg",
                        color: _sponsorHistory ? Colors.yellow : Colors.white,
                      ),
                      Text(
                        "History",
                        style: TextStyle(
                            color: _sponsorHistory ? Colors.yellow : Colors.white,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _sponsorHome = false;
                    _sponsorDeposit = false;
                    _sponsorHistory = false;
                    _sponsorProfile = true;
                  });
                },
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width*.25,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "images/profile.svg",
                        color: _sponsorProfile ? Colors.yellow : Colors.white,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: _sponsorProfile ? Colors.yellow : Colors.white,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: _buildUI());
  }

  Widget _buildUI() {
    if (_sponsorDeposit) {
      return screens[1];
    }
    if (_sponsorHistory) {
      return screens[2];
    }
    if (_sponsorProfile) {
      return screens[3];
    }

    return screens[0];
  }
}

