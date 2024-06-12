import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/resources/components/constants.dart';
import 'package:radigone_v3/view/sponsor_view/profile/sponser_profile_view.dart';
import 'package:radigone_v3/view/sponsor_view/sponsor_side_menubar.dart';
import 'package:radigone_v3/view_model/services/auth_services.dart';

import '../../resources/colors.dart';
import 'deposit/sponsor_deposit_view.dart';
import 'history/sponsor_history_view.dart';
import 'home/sponser_home_view.dart';

class SponsorMainScreen extends StatefulWidget {

  // final bool sponsorHome,sponsorDeposit,sponsorHistory,sponsorProfile;
  //  const SponsorMainScreen({super.key,required this.sponsorHome, required this.sponsorDeposit, required this.sponsorHistory,required this.sponsorProfile});
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

  //
  // bool _sponsorHome = false;
  // bool _sponsorDeposit = false;
  // bool _sponsorHistory = false;
  // bool _sponsorProfile = false;


  List<dynamic> screens = [
    const SponsorHomeView(),
    const SponsorDepositView(),
    const SponsorHistoryView(),
    const SponsorProfileView()
  ];

  late AuthService _authService;
  String? sponsorName,
  sponsorEmail,
   sponsorImageLink;

 Future<void> _initializeValues() async {
 

    // sponsorName = await _authService.getSponsorName() ?? "Sponsor Name";
    // sponsorEmail = await _authService.getSponsorEmail() ?? "Sponsor Email";
    sponsorName = await _authService.getSponsorName();
    sponsorEmail = await _authService.getSponsorEmail();
    sponsorImageLink =
        await _authService.getSponsorImageLink() ?? PLACEHOLDER_PFP;



  }

  @override
  void initState() {
    // _sponsorHome = widget.sponsorHome;
    // _sponsorDeposit = widget.sponsorDeposit;
    // _sponsorHistory = widget.sponsorHistory;
    // _sponsorProfile = widget.sponsorProfile;
    // WidgetsBinding.instance.addPostFrameCallback((val) {
    //   _initializeValues();
    // });
    super.initState();

    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();
    _initializeValues();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
         drawer:
        // SponsorSideBarView(
        //   sponsorName: sponsorName,sponsorEmail: sponsorEmail,sponsorProfileImageLink: PLACEHOLDER_PFP,
        // ),

         FutureBuilder(
             future: _initializeValues(),
             builder: (context, snapshot) {
               if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none){
                 return const SponsorSideBarView(
                   sponsorName: "Fetching..",
                   sponsorEmail: "Fetching..",
                   sponsorProfileImageLink: null,
                 );

               }
               if(snapshot.hasError){
                 print(snapshot.error.toString());
                 return const SponsorSideBarView(
                   sponsorName: "Error..",
                   sponsorEmail: "Error..",
                   sponsorProfileImageLink: null,
                 );
               }
               return  SponsorSideBarView(
                 sponsorName: 'Hi $sponsorName',
                 sponsorEmail: sponsorEmail,
                 sponsorProfileImageLink: null,
               );
             }),

        bottomNavigationBar: Container(
          height: 60,
          // padding: EdgeInsets.zero,
          decoration: const BoxDecoration(


            gradient: MyColorScheme.bottomNavigationBar,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
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
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.sizeOf(context).width * .25,
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
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.sizeOf(context).width * .25,
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
                            color:
                                _sponsorDeposit ? Colors.yellow : Colors.white,
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
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.sizeOf(context).width * .25,
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
                            color:
                                _sponsorHistory ? Colors.yellow : Colors.white,
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
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.sizeOf(context).width * .25,
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
                            color:
                                _sponsorProfile ? Colors.yellow : Colors.white,
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
