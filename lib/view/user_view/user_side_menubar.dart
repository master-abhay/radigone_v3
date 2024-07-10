import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';

import '../../view_model/user_view_model/auth_viewModels/logout_view_model.dart';


class UserSideBar extends StatefulWidget {
  final String? userName;
  final String? userEmail;
  final String? userProfileImageLink;

  const UserSideBar({
    super.key,
    this.userName,
    this.userEmail,
    this.userProfileImageLink,
  });

  @override
  State<UserSideBar> createState() => _UserSideBarState();
}

class _UserSideBarState extends State<UserSideBar> {



  late NavigationServices _navigationServices;
  @override
  void initState() {
    super.initState();
    final GetIt _getIt = GetIt.instance;

    _navigationServices = _getIt.get<NavigationServices>();

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
                          // "images/images_user_sidebar/Ellipse 28.png",
                          widget.userProfileImageLink ??
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                          fit: BoxFit.cover,
                          height: MediaQuery.sizeOf(context).width / 7,
                          width: MediaQuery.sizeOf(context).width / 7,
                          errorBuilder: (context, object, _) {
                            return SvgPicture.asset(
                              "images/images_user_sidebar/profile.svg",
                              fit: BoxFit.cover,
                              height: MediaQuery.sizeOf(context).width / 7,
                              width: MediaQuery.sizeOf(context).width / 7,);
                          },
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 28,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).width*0.12,
                        width: MediaQuery.sizeOf(context).width*0.5,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.userName ?? "User Name",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: SelectableText(
                                  widget.userEmail ?? "User Email",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.65)),
                                ),
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
                  // ListTile(
                  //   // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                  //   title: const Text(
                  //     "Profile",
                  //     style: TextStyle(color: Colors.white, fontSize: 14),
                  //   ),
                  //   leading: SvgPicture.asset(
                  //       "images/images_user_sidebar/profile.svg"),
                  //   dense: true,
                  //   horizontalTitleGap: 5,
                  //   onTap: () {
                  //     _navigationServices.goBack();
                  //     _navigationServices.pushNamed("/userProfilePage");
                  //   },
                  // ),
                  ListTile(
                    // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                    title: const Text(
                      "Redeem Radigone Points",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    leading: SvgPicture.asset(
                        "images/images_user_sidebar/recharge_wallet.svg"),
                    dense: true,
                    horizontalTitleGap: 5,
                    onTap: () {
                      _navigationServices.goBack();
                      _navigationServices.pushNamed("/redeemRadigonePoints");
                    },
                  ),
                  ListTile(
                    // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                    title: const Text(
                      "Transaction",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    leading:
                    // SvgPicture.asset("images/images_user_sidebar/recharge_wallet.svg"),
                    SvgPicture.asset("images/coin.svg",height: 19,width: 19,),

                    dense: true,
                    horizontalTitleGap: 5,
                    onTap: () {
                      _navigationServices.goBack();
                      _navigationServices.pushNamed("/transactionView");
                    },
                  ),

//// Will be used in Phase 2
//                   ExpansionTile(
//                     title: Row(
//                       children: [
//                         SvgPicture.asset(
//                           "images/images_user_sidebar/coupons.svg",
//                           // Adjust the icon size if needed
//                         ),
//                         const SizedBox(width: 13),
//                         // Adjust the space between icon and text
//                         const Text(
//                           "Support Ticket",
//                           style: TextStyle(color: Colors.white, fontSize: 14),
//                         ),
//                       ],
//                     ),
//                     iconColor: Colors.white,
//                     collapsedIconColor: Colors.white,
//                     children: <Widget>[
//                       GestureDetector(
//                         onTap: () {
//                           _navigationServices.goBack();
//                           _navigationServices.pushNamed('/createTicketView');
//                         },
//                         child:Container(
//                           color: Colors.transparent,
//                             padding: const EdgeInsets.all(8),
//                             // width: MediaQuery.sizeOf(context).width * 0.3,
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 SizedBox(width: MediaQuery.of(context).size.width*0.2,),
//                                 SvgPicture.asset(
//                                     "images/images_sponser_sidebar/deposit_dropdown.svg"),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 const Text(
//                                   "Create Ticket",
//                                   style:
//                                   TextStyle(color: Colors.white, fontSize: 14),
//                                 )
//                               ],
//                             )),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           _navigationServices.goBack();
//                           _navigationServices.pushNamed('/myTicketView');
//                         },
//                         child: Container(
//                           color: Colors.transparent,
//                             padding: const EdgeInsets.all(8),
//                             // width: MediaQuery.sizeOf(context).width * 0.3,
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 SizedBox(width: MediaQuery.of(context).size.width*0.2,),
//                                 SvgPicture.asset(
//                                     "images/images_sponser_sidebar/deposit_dropdown.svg"),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 const Text(
//                                   "My Tickets",
//                                   style:
//                                   TextStyle(color: Colors.white, fontSize: 14),
//                                 )
//                               ],
//                             )),
//                       ),
//                     ],
//                   ),


                  // ListTile(
                  //   // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                  //   title: const Text(
                  //     "Earning",
                  //     style: TextStyle(color: Colors.white, fontSize: 14),
                  //   ),
                  //   leading: SvgPicture.asset(
                  //       "images/images_user_sidebar/earning.svg"),
                  //   dense: true,
                  //   horizontalTitleGap: 5,
                  //   onTap: () {},
                  // ),
                  // ListTile(
                  //   // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                  //   title: const Text(
                  //     "Coupons",
                  //     style: TextStyle(color: Colors.white, fontSize: 14),
                  //   ),
                  //   leading: SvgPicture.asset(
                  //       "images/images_user_sidebar/coupons.svg"),
                  //   dense: true,
                  //   horizontalTitleGap: 5,
                  //   onTap: () {},
                  // ),
                  // ListTile(
                  //   // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                  //   title: const Text(
                  //     "Ads Preferences",
                  //     style: TextStyle(color: Colors.white, fontSize: 14),
                  //   ),
                  //   leading: SvgPicture.asset(
                  //       "images/images_user_sidebar/ads_preferences.svg"),
                  //   dense: true,
                  //   horizontalTitleGap: 5,
                  //   onTap: () {
                  //
                  //     _navigationServices.pushNamed('/adsPreferencesView');
                  //
                  //   },
                  // ),
                  ListTile(
                    // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                    title: const Text(
                      "Ads History",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    leading: SvgPicture.asset(
                        "images/images_user_sidebar/ads_history.svg"),
                    dense: true,
                    horizontalTitleGap: 5,
                    onTap: () {},
                  ),
                  // ListTile(
                  //   // minTileHeight: MediaQuery.of(context).size.width * 0.12,
                  //   title: const Text(
                  //     "Recharge Wallet",
                  //     style: TextStyle(color: Colors.white, fontSize: 14),
                  //   ),
                  //   leading: SvgPicture.asset(
                  //       "images/images_user_sidebar/recharge_wallet.svg"),
                  //   dense: true,
                  //   horizontalTitleGap: 5,
                  //   onTap: () {},
                  // ),
                ],
              ),
            ],
          ),
          Consumer<LogoutUserProvider>(
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
                    bool result = await value.logOutUser(context);
                  },
                );
              }),

        ],
      ),
    );
  }
}