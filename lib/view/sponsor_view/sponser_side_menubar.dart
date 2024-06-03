import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SponserSideBar extends StatefulWidget {
  final String? sponserName;
  final String? sponserEmail;
  final String? sponserProfileImageLink;

  const SponserSideBar({
    super.key,
    this.sponserName,
    this.sponserEmail,
    this.sponserProfileImageLink,
  });

  @override
  State<SponserSideBar> createState() => _SponserSideBarState();
}

class _SponserSideBarState extends State<SponserSideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff1E2329),
      // shadowColor: const Color(0xffffffff),
      elevation: 1,
      width: MediaQuery.sizeOf(context).width * 0.75,

      child: SingleChildScrollView(
        child: Column(
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
                        // "images/images_sponser_sidebar/Ellipse 28.png",
                        widget.sponserProfileImageLink ??
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
                                widget.sponserName ?? "Sponser Name",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            Expanded(
                              child: SelectableText(
                                widget.sponserEmail ?? "Sponser Email",
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

            ListTile(
              // minTileHeight: MediaQuery.of(context).size.width * 0.12,
              title: const Text(
                "Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              leading:
              SvgPicture.asset("images/images_agent_sidebar/dashboard.svg"),
              dense: true,
              horizontalTitleGap: 5,
              onTap: () {},
            ),

            //Deposit Expansion
            ExpansionTile(
              title: Row(
                children: [
                  SvgPicture.asset(
                    "images/images_agent_sidebar/deposit.svg",
                    // Adjust the icon size if needed
                  ),
                  const SizedBox(width: 13),
                  // Adjust the space between icon and text
                  const Text(
                    "Deposit",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                "images/images_sponser_sidebar/deposit_dropdown.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Deposit Now",
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                "images/images_sponser_sidebar/deposit_dropdown.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Deposit Log",
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                "images/images_sponser_sidebar/deposit_dropdown.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Buy Views",
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),

            //All Campaigns Expansion
            ExpansionTile(
              title: Row(
                children: [
                  SvgPicture.asset(
                    "images/images_sponser_sidebar/allCampaign.svg",
                    // Adjust the icon size if needed
                  ),
                  const SizedBox(width: 13),
                  // Adjust the space between icon and text
                  const Text(
                    "All Campaigns",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                "images/images_sponser_sidebar/deposit_dropdown.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Deposit Now",
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                "images/images_sponser_sidebar/deposit_dropdown.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Buy Views",
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),

            ListTile(
              // minTileHeight: MediaQuery.of(context).size.width * 0.12,
              title: const Text(
                "Calender",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              leading: SvgPicture.asset(
                  "images/images_sponser_sidebar/calender.svg"),
              dense: true,
              horizontalTitleGap: 5,
              onTap: () {},
            ),
            ListTile(
              // minTileHeight: MediaQuery.of(context).size.width * 0.12,
              title: const Text(
                "Report",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              leading:
              SvgPicture.asset("images/images_sponser_sidebar/report.svg"),
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
                  "images/images_sponser_sidebar/transaction.svg"),
              dense: true,
              horizontalTitleGap: 5,
              onTap: () {},
            ),
            ListTile(
              // minTileHeight: MediaQuery.of(context).size.width * 0.12,
              title: const Text(
                "Support Ticket",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              leading: SvgPicture.asset(
                  "images/images_sponser_sidebar/supportTicket.svg"),
              dense: true,
              horizontalTitleGap: 5,
              onTap: () {},
            ),
            ListTile(
              // minTileHeight: MediaQuery.of(context).size.width * 0.12,
              title: const Text(
                "2FA Security",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              leading: SvgPicture.asset(
                  "images/images_sponser_sidebar/twoFASecurity.svg"),
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
              leading:
              SvgPicture.asset("images/images_sponser_sidebar/profile.svg"),
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
                  "images/images_sponser_sidebar/changePassword.svg"),
              dense: true,
              horizontalTitleGap: 5,
              onTap: () {},
            ),
            // Consumer<LogOutSponserProvider>(
            //     builder: (BuildContext context, value, Widget? child) {
            //       return ListTile(
            //         title: const Text(
            //           "Logout",
            //           style: TextStyle(color: Colors.white, fontSize: 14),
            //         ),
            //         leading:
            //         SvgPicture.asset("images/images_user_sidebar/logout.svg"),
            //         dense: true,
            //         horizontalTitleGap: 5,
            //         onTap: () async {
            //           bool result = await value.logOutSponser();
            //         },
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}