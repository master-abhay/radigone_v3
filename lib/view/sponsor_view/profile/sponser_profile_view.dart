import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_profile_information_viewModel.dart';

import '../../../data/response/status.dart';
import '../../../resources/colors.dart';
import '../../../resources/components/constants.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/user_view_model/profile_view_model.dart';

class SponsorProfileView extends StatefulWidget {
  const SponsorProfileView({super.key});

  @override
  State<SponsorProfileView> createState() => _SponsorProfileViewState();
}

class _SponsorProfileViewState extends State<SponsorProfileView> {
  late NavigationServices _navigationServices;

  @override
  void initState() {
    super.initState();

    final GetIt _getIt = GetIt.instance;
    _navigationServices = _getIt.get<NavigationServices>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider =
      Provider.of<SponsorProfileInformationViewModel>(context, listen: false);

      // await provider.setToken();
      await provider.fetchProfileInformation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<LogoutUserProvider>(context);

    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 8,
          decoration: const BoxDecoration(
              gradient: MyColorScheme.yellowLinearGradient,
              borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 50, bottom: 50),
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //header to display page name:
                header(),

                // Edit Button
                edit(),

                //Profile Image:
                profileImage(),

                //App User Information:
                appUserInformation(),

                //footer : Change password and Start Survey Button
                footer()
              ],
            ),
          ),
        )
      ],
    );
  }

  TextStyle titleTextStyle() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black.withOpacity(0.35));
  }

  TextStyle fieldTextStyle() {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black);
  }

  TextStyle statusTextStyle() {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff2BD41C));
  }

  Widget header() {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: MediaQuery.sizeOf(context).width * 0.15,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Profile Settings",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Widget edit() {
    return GestureDetector(
      onTap: () {
        _navigationServices.pushNamed("/profileEditPage");
      },
      child: const Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Edit",
              style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            Icon(
              Icons.edit,
              color: Colors.yellow,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  Widget profileImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 40),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(180),
        color: Colors.grey,
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(180),
            ),
            child: Image.asset(
              "images/profileImage.png",
              fit: BoxFit.cover,
              errorBuilder: (context, object, stacktrace) {
                return Image.network(PLACEHOLDER_PFP, fit: BoxFit.cover);
              },
            )),
      ),
    );
  }

  Widget userInformation({required String title, required String field}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "$title : ",
              style: titleTextStyle(),
            ),
            SizedBox(
                height: 20,
                width: MediaQuery.sizeOf(context).width * 0.65,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Expanded(
                          child: Text(field,
                              style: title != 'Status'
                                  ? fieldTextStyle()
                                  : statusTextStyle())),
                    ],
                  ),
                )),
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.7),
        )
      ]),
    );
  }

  Widget appUserInformation() {


    return  Consumer<SponsorProfileInformationViewModel>(
        builder: (context, providerValue, Widget? child) {
          switch (providerValue.profileInfo.status) {
            case Status.LOADING:
              return const SizedBox(
                height: 300,
                child:  Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ),
                ),
              );

            case Status.ERROR:
              return const Padding(
                padding:  EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                        height: 300,child: Text("Please Check Your Internet Connection"))
                  ],
                ),
              );


            case Status.COMPLETED:
              return Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    userInformation(
                        title: "Name",
                        field:
                        '${providerValue.profileInfo.data!.surveyor!.firstname.toString()} ${providerValue.profileInfo.data!.surveyor!.lastname.toString()}'),
                    userInformation(
                        title: "E-mail",
                        field: providerValue.profileInfo.data!.surveyor!.email.toString()),
                    userInformation(
                        title: "Phone",
                        field: providerValue.profileInfo.data!.surveyor!.mobile.toString()),
                    userInformation(
                        title: "Country",
                        field:
                        '${providerValue.profileInfo.data?.surveyor!.address!.country.toString()}'),
                    userInformation(
                        title: "Balance",
                        field: '${providerValue.profileInfo.data?.surveyor!.balance.toString()}'),
                    userInformation(
                        title: "Status",
                        field: providerValue.profileInfo.data!.surveyor!.status == 1
                            ? "Active"
                            : "Not Active"),
                  ],
                ),
              );



            case null:
              return const Center(
                child: Text("Null Values Found. Please contact Support"),
              );
          }
        });




    //
    //   return Consumer<UserProfileInformationProvider>(
    //       builder: (context, providerValue, Widget? child) {
    //   });
  }

  Widget footerButton(
      {required String buttonName,
        required IconData icon,
        required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.black.withOpacity(0.1),
        shadowColor: const Color(0xffFDD900).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        elevation: 1,
        child: Container(
          height: 45,
          width: MediaQuery.sizeOf(context).width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                buttonName,
                style: const TextStyle(
                    color: Color(0xffFDD900),
                    fontSize: 12.2,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 4,
              ),
              Icon(
                icon,
                color: const Color(0xffFDD900),
                size: 14,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget footer() {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            footerButton(
                buttonName: "Change Password",
                icon: Icons.lock,
                onTap: () {
                  _navigationServices.pushNamed('/changePassword');
                }),
            footerButton(
                buttonName: "Start Survey",
                icon: Icons.question_mark,
                onTap: () {}),
          ],
        ));
  }
}
