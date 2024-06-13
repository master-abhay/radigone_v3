import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import 'package:radigone_v3/view/agent_view/profile/agent_profile_view.dart';

import '../../resources/colors.dart';
import '../../resources/components/constants.dart';
import '../../view_model/services/auth_services.dart';
import 'agent_side_menubar.dart';
import 'deposit/agent_deposit_view.dart';
import 'history/agent_history_view.dart';
import 'home/agent_home_view.dart';

class AgentMainView extends StatefulWidget {
  const AgentMainView({super.key});

  @override
  State<AgentMainView> createState() => _AgentMainViewState();
}

class _AgentMainViewState extends State<AgentMainView> {

  String? _agentName, _agentEmail, _agentImageLink;

  late AuthService _authService;

  @override
  void initState() {

    super.initState();
    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();

    initializeValues();
  }

  Future<void> initializeValues() async {

    _agentName = await _authService.getAgentName();
    _agentEmail = await _authService.getAgentEmail();
    _agentImageLink = await _authService.getAgentImageLink() ?? PLACEHOLDER_PFP;
  }

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  bool _agentHome = true;
  bool _agentDeposit = false;
  bool _agentHistory = false;
  bool _agentProfile = false;

  List<dynamic> screens = [
    const AgentHomeView(),
    const AgentDepositView(),
    const AgentHistoryView(),
    const AgentProfileView()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer:         FutureBuilder(
            future: initializeValues(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none){
                return const AgentSideBar(
                  agentName: "Fetching..",
                  agentEmail: "Fetching..",
                  agentProfileImageLink: null,
                );

              }
              if(snapshot.hasError){
                print(snapshot.error.toString());
                return const AgentSideBar(
                  agentName: "Error..",
                  agentEmail: "Error..",
                  agentProfileImageLink: null,
                );
              }
              return  AgentSideBar(
                agentName: 'Hi $_agentName',
                agentEmail: _agentEmail,
                // agentProfileImageLink: _agentImageLink,
              );
            })
      ,
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
                    _agentHome = true;
                    _agentDeposit = false;
                    _agentHistory = false;
                    _agentProfile = false;
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
                        color: _agentHome ? Colors.yellow : Colors.white,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: _agentHome ? Colors.yellow : Colors.white,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _agentHome = false;
                    _agentDeposit = true;
                    _agentHistory = false;
                    _agentProfile = false;
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
                        color: _agentDeposit ? Colors.yellow : Colors.white,
                      ),
                      Text(
                        "Deposit",
                        style: TextStyle(
                            color: _agentDeposit ? Colors.yellow : Colors.white,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _agentHome = false;
                    _agentDeposit = false;
                    _agentHistory = true;
                    _agentProfile = false;
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
                        color: _agentHistory ? Colors.yellow : Colors.white,
                      ),
                      Text(
                        "History",
                        style: TextStyle(
                            color: _agentHistory ? Colors.yellow : Colors.white,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _agentHome = false;
                    _agentDeposit = false;
                    _agentHistory = false;
                    _agentProfile = true;
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
                        color: _agentProfile ? Colors.yellow : Colors.white,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            color: _agentProfile ? Colors.yellow : Colors.white,
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
    if (_agentDeposit) {
      return screens[1];
    }
    if (_agentHistory) {
      return screens[2];
    }
    if (_agentProfile) {
      return screens[3];
    }

    return screens[0];
  }
}
