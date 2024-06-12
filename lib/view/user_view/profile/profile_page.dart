import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../resources/colors.dart';
import '../../../resources/components/background_designs.dart';
import '../../../resources/components/constants.dart';
import '../../../resources/components/custom_header.dart';
import '../../../view_model/services/navigation_services.dart';
import '../../../view_model/user_view_model/profile_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late NavigationServices _navigationServices;

  @override
  void initState() {
    super.initState();

    final GetIt _getIt = GetIt.instance;
    _navigationServices = _getIt.get<NavigationServices>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider =
          Provider.of<UserProfileInformationProvider>(context, listen: false);
      await provider.setUsername();
      await provider.setPassword();
      await provider.setToken();
      await provider.profileInformation(context);
    });
  }

  Future<void> _onRefresh()async{
    final provider =
    Provider.of<UserProfileInformationProvider>(context, listen: false);
    await provider.setUsername();
    await provider.setPassword();
    await provider.setToken();
    await provider.profileInformation(context);
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
        const LowerBackgroundDesign(),
        const UpperBackgroundDesign(),
        //header to display page name:
         CustomHeader(title: "Profile Settings",),
        Container(
            // height: double.infinity,
            // width: double.infinity,
            margin: const EdgeInsets.only(top: 120, bottom: 50),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:

            RefreshIndicator(
              backgroundColor: Colors.black,
              color: Colors.white,
              displacement: 40,
              strokeWidth: 1.5,
              onRefresh: _onRefresh,
              child: SingleChildScrollView(
              child: Column(
                children: [


                      // Edit Button
                      edit(),

                      //Profile Image:
                      profileImage(),

                      //App User Information:
                      appUserInformation(),

                      //footer : Change password and Start Survey Button
                      footer(),

                  ////just to make enable pull to refresh: Bad Approach
                  const SizedBox(height: 120,)




                ],
              ),
            ),
          ),
        )
      ],
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
              style: MyColorScheme.detailTitleTextStyle(),
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
                                  ? MyColorScheme.detailFieldTextStyle()
                                  : MyColorScheme.detailStatusTextStyle())),
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


  return  Consumer<UserProfileInformationProvider>(
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
                        '${providerValue.profileInfo.data?.firstname} ${providerValue.profileInfo.data?.lastname}'),
                    userInformation(
                        title: "E-mail",
                        field: '${providerValue.profileInfo.data?.email}'),
                    userInformation(
                        title: "Phone",
                        field: '${providerValue.profileInfo.data?.mobile}'),
                    userInformation(
                        title: "Country",
                        field:
                        '${providerValue.profileInfo.data?.address?.country}'),
                    userInformation(
                        title: "Balance",
                        field: '${providerValue.profileInfo.data?.balance}'),
                    userInformation(
                        title: "Status",
                        field: providerValue.userProfileInformation?.status == 1
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
