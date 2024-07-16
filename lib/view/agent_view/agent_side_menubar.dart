import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../view_model/common_viewModel/logout_view_model.dart';
import '../../view_model/services/auth_services.dart';
import '../../view_model/services/navigation_services.dart';

class AgentSideBar extends StatefulWidget {
  final String? agentName;
  final String? agentEmail;
  final String? agentProfileImageLink;
  const AgentSideBar({
    super.key,
    this.agentName,
    this.agentEmail,
    this.agentProfileImageLink,
  });

  @override
  State<AgentSideBar> createState() => _AgentSideBarState();
}

class _AgentSideBarState extends State<AgentSideBar> {

  late NavigationServices _navigationServices;
  late AuthService _authService;

  @override
  void initState() {
    super.initState();

    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();
    _authService = getIt.get<AuthService>();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff1E2329),
      // shadowColor: const Color(0xffffffff),
      elevation: 1,
      width: MediaQuery.sizeOf(context).width * 0.75,

      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 5.8,
                decoration: const BoxDecoration(
                    color: Color(0xff4F545A),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.network(
                          // "images/images_agent_sidebar/Ellipse 28.png",
                          widget.agentProfileImageLink ??
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                          fit: BoxFit.cover,
                          height: MediaQuery.sizeOf(context).width / 7,
                          width: MediaQuery.sizeOf(context).width / 7,
                          errorBuilder: (context, object, _) {
                            return Image.network(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                              fit: BoxFit.cover,
                              height: MediaQuery.sizeOf(context).width / 7,
                              width: MediaQuery.sizeOf(context).width / 7,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 28,
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.agentName ?? "agent Name",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              SelectableText(
                                widget.agentEmail ?? "Email",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.65)),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  ListTile(
                    // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                    title: const Text(
                      "Dashboard",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    leading: SvgPicture.asset(
                        "images/images_agent_sidebar/dashboard.svg"),
                    dense: true,
                    horizontalTitleGap: 5,
                    onTap: () {},
                  ),
                  ListTile(
                    // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                    title: const Text(
                      "Transaction",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    leading: SvgPicture.asset(
                        "images/images_agent_sidebar/transaction.svg"),
                    dense: true,
                    horizontalTitleGap: 5,
                    onTap: () {},
                  ),

                  ////Phase 2 Implementation:

                  // ListTile(
                  //   // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                  //   title: const Text(
                  //     "2FA Security",
                  //     style: TextStyle(color: Colors.white, fontSize: 14),
                  //   ),
                  //   leading: SvgPicture.asset(
                  //       "images/images_agent_sidebar/twoFASecurity.svg"),
                  //   dense: true,
                  //   horizontalTitleGap: 5,
                  //   onTap: () {},
                  // ),
                  ListTile(
                    // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                    title: const Text(
                      "Earnings",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    leading: SvgPicture.asset(
                        "images/images_agent_sidebar/earning.svg",height: 17,width: 17,),
                    dense: true,
                    horizontalTitleGap: 5,
                    onTap: () {
                      _navigationServices.pushNamed('/agentEarningView');
                    },
                  ),
                  ListTile(
                    // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                    title: const Text(
                      "Deposit",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    leading: SvgPicture.asset(
                        "images/images_agent_sidebar/deposit.svg"),
                    dense: true,
                    horizontalTitleGap: 5,
                    onTap: () {},
                  ),
                  ListTile(
                    // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                    title: const Text(
                      "Profile",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    leading: SvgPicture.asset(
                        "images/images_agent_sidebar/profile.svg"),
                    dense: true,
                    horizontalTitleGap: 5,
                    onTap: () {},
                  ),
                  ListTile(
                    // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                    title: const Text(
                      "Change Password",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    leading: SvgPicture.asset(
                        "images/images_agent_sidebar/changePassword.svg"),
                    dense: true,
                    horizontalTitleGap: 5,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          Consumer<LogoutProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return ListTile(
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  leading:
                  SvgPicture.asset("images/images_user_sidebar/logout.svg"),
                  dense: true,
                  horizontalTitleGap: 5,
                  onTap: () async {
                    String token = await _authService.getSponsorToken() ?? '';
                    await value.logOut(context, token: token);
                  },
                );
              }),
        ],
      ),
    );
  }
}