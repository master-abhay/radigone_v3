// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
//
// import '../../../resources/colors.dart';
// import '../../../view_model/user_view_model/dashboard_ads_list_view_model.dart';
// import '../user_side_menubar.dart';
// import 'Ad_Container.dart';
// import 'Ad_Specification_with_download.dart';
// import 'account_Status.dart';
// import 'dashboard_info_container.dart';
//
// class SponsorHomeView extends StatefulWidget {
//   const SponsorHomeView({super.key});
//
//   @override
//   State<SponsorHomeView> createState() => _SponsorHomeViewState();
// }
//
//
//
//
//
// class _SponsorHomeViewState extends State<SponsorHomeView> {
//   //Defining Global Key to open the Drawer:
//   final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
//   // late Future<void> _initialRadigonePointsData;
//
//
//   // Future<void> _initializeData() async {
//   //   final provider =
//   //       Provider.of<UserRadigonePointsProvider>(context, listen: false);
//   //
//   //   provider.setUsername();
//   //   provider.userRadigonePoints();
//   // }
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     // _initialRadigonePointsData = _initializeData();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       final provider =
//           Provider.of<DashboardUserProvider>(context, listen: false);
//       await provider.setUsername();
//       await provider.setPassword();
//       await provider.setToken();
//       await provider.loginUserDashboard(context);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("Build");
//
//     return Scaffold(
//       key: _drawerKey,
//       drawer: const UserSideBar(userName: "Abhay Kumar So shri kuldeep chand"),
//       body: buildUI(),
//     );
//   }
//
//   Widget buildUI() {
//     return Stack(
//       children: [
//         Container(
//           height: double.infinity,
//           decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
//         ),
//         Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height / 3.75,
//           decoration: const BoxDecoration(
//               gradient: MyColorScheme.yellowLinearGradient,
//               borderRadius:
//                   BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
//         ),
//         Consumer<DashboardUserProvider>(
//             builder: (context, providerValue, Widget? child) {
//           if (providerValue.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.white,
//                 strokeWidth: 1.5,
//               ),
//             );
//           }
//
//           return SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: double.infinity,
//                 width: double.infinity,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       //To show the Status of the Account
//                       const AccountStatus(), //To show App Bar of the app:
//                       headerText(),
//
//                       //MainContainers:
//                       mainOutlinedContainer(context),
//
//                       //Ads Section:
//                       AdsSection(context),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         })
//       ],
//     );
//   }
//
//   //This is Header with hamburger icon App logo and coins details
//   Widget headerText() {
//     return Container(
//       // color: Colors.purple,
//       margin: const EdgeInsets.symmetric(horizontal: 15),
//       height: 37,
//       child: Stack(
//         alignment: Alignment.centerRight,
//         children: [
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Hamburger:
//               GestureDetector(
//                 onTap: () {
//                   _drawerKey.currentState!.openDrawer();
//                   //implement drawer Functionality:
//                 },
//                 child: SizedBox(
//                   height: 12,
//                   width: 16,
//                   child: SvgPicture.asset("images/hamburger.svg"),
//                 ),
//               ),
//
//               //Radigone Icon:
//
//               Image.asset(
//                 "images/splash_logo.png",
//                 height: 23,
//               ),
//
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     height: 12,
//                     color: Colors.transparent,
//                     width: 16,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Stack(
//             alignment: Alignment.centerRight,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(right: 20),
//                 height: 15,
//                 // alignment: Alignment.centerLeft,
//                 padding: const EdgeInsets.only(right: 10, left: 3),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child:  Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//
//                     // FutureBuilder(future: _initialRadigonePointsData, builder: (context,snapshot){
//                     //
//                     //   if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none){
//                     //     Text("Fetching...");
//                     //   }
//                     //   if(snapshot.hasError){
//                     //     Text("error");
//                     //   }
//                     //
//                     //   return Text(
//                     //     "6555",
//                     //     style:
//                     //     TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                     //   );
//                     // }),
//
//
//
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 27,
//                 width: 27,
//                 decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(180)),
//                 child: Image.asset("images/coin.png"),
//                 // child: SvgPicture.asset("images/coin.svg"),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
// // This is the Main Container which stores the information of the Total Balance and ... Completed Survey etc....
// Widget mainOutlinedContainer(BuildContext context) {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 25),
//     height: MediaQuery.sizeOf(context).height * 0.42,
//     width: MediaQuery.sizeOf(context).width /
//         1.15, // color: Colors.blue.withOpacity(0.5),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //Total Balance container:
//             DashboardInformationContainer(
//                 icon: SvgPicture.asset("images/total_balance.svg"),
//                 borderRadius: 180,
//                 text: "Total\nBalance",
//                 containerValue: "3 INR"), //Completed Survey container:
//             DashboardInformationContainer(
//                 icon: SvgPicture.asset("images/completed_survey.svg"),
//                 borderRadius: 2,
//                 text: "Completed\nSurvey",
//                 containerValue: "1")
//           ],
//         ),
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //Total Withdraw container
//             DashboardInformationContainer(
//                 icon: SvgPicture.asset("images/total_withdraw.svg"),
//                 borderRadius: 180,
//                 text: "Total\nWithdraw",
//                 containerValue: "3 INR"),
//
//             //completed Transaction Container:
//             DashboardInformationContainer(
//                 icon: SvgPicture.asset('images/data_transfer.svg'),
//                 borderRadius: 180,
//                 text: "Completed\nTransaction",
//                 containerValue: "1")
//           ],
//         ),
//       ],
//     ),
//   );
// }
//
// // Specified Ads Screen
// Widget AdsSection(BuildContext context) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       //Showing the Ad_specification: Upcoming specified:
//       AdSpecification(
//         specificationName: "Upcoming Next",
//         onTap: () {},
//       ),
//
//       // Consumer<DashboardUserProvider>(
//       //   builder: (context, providerValue, Widget? child) {
//       //     return SizedBox(
//       //       height: MediaQuery.of(context).size.height * 0.27,
//       //       child: ListView.builder(
//       //           scrollDirection: Axis.horizontal,
//       //           // itemCount: UserDashboardModelObject.userDashboard.data?.length,
//       //           itemCount: providerValue.userDashboard.data?.length,
//       //           itemBuilder: (context, index) {
//       //             print(
//       //                 "-----------------printing the length of the AdsData :");
//       //             var item = providerValue.userDashboard.data?[index];
//       //             return Container(
//       //                 margin: const EdgeInsets.only(right: 13),
//       //                 child: AdContainer(
//       //                   imageUrl: 'https://radigone.com${item?.image}',
//       //                   title: item?.name,
//       //                   subtitle: item?.pSpecification,
//       //                   radigonePoints: item?.pMrp,
//       //                   onTap: () {},
//       //                 ));
//       //           }),
//       //     );
//       //   },
//       // ),
//
//       SizedBox(
//         height: MediaQuery.of(context).size.height * 0.02,
//       ),
//
//       //Showing the Ad_specification: Upcoming specified:
//       AdSpecification(
//         specificationName: "Birthday Month",
//         onTap: () {},
//       ),
//
//       SizedBox(
//         height: MediaQuery.of(context).size.height * 0.27,
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 20,
//             itemBuilder: (context, index) {
//               return Container(
//                   margin: const EdgeInsets.only(right: 13),
//                   child: AdContainer(
//                     onTap: () {},
//                   ));
//             }),
//       ),
//
//       SizedBox(
//         height: MediaQuery.of(context).size.height * 0.02,
//       ),
//
//       //Showing the Ad_specification: Anniversary specified:
//       AdSpecification(
//         specificationName: "Anniversary Month",
//         onTap: () {},
//       ),
//
//       SizedBox(
//         height: MediaQuery.of(context).size.height * 0.27,
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 20,
//             itemBuilder: (context, index) {
//               return Container(
//                   margin: const EdgeInsets.only(right: 13),
//                   child: AdContainer(
//                     onTap: () {},
//                   ));
//             }),
//       ),
//     ],
//   );
// }
//
//
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:radigone_v3/view_model/services/flutter_secure_storage/secure_storage.dart';
// //
// // class SponsorHomeView extends StatefulWidget {
// //   const SponsorHomeView({super.key});
// //
// //   @override
// //   State<SponsorHomeView> createState() => _SponsorHomeViewState();
// // }
// //
// // class _SponsorHomeViewState extends State<SponsorHomeView> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(appBar: AppBar(title: Text("home page"),
// //     ),
// //
// //     body: Center(
// //       child: TextButton(onPressed: ()async{
// //        var username =  await SecureStorage().readSecureData('username');
// //        var password =  await SecureStorage().readSecureData('password');
// //        var token =  await SecureStorage().readSecureData('token');
// //
// //        if(kDebugMode){
// //          print(username);
// //          print(password);
// //          print(token);
// //
// //        }
// //       },child: Text("print Secure data"),),
// //     ),);
// //   }
// // }
//

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import 'package:radigone_v3/view_model/user_view_model/radigonePoint_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/user_points_view_model.dart';

import '../../../data/response/status.dart';
import '../../../resources/colors.dart';
import '../../../resources/components/account_Status.dart';
import '../../../resources/components/background_designs.dart';
import '../../../resources/components/dashboard_info_container.dart';
import '../../../view_model/services/auth_services.dart';
import '../../../view_model/user_view_model/dashboard_ads_list_view_model.dart';
import '../sponsor_side_menubar.dart';

class SponsorHomeView extends StatefulWidget {
  const SponsorHomeView({super.key});

  @override
  State<SponsorHomeView> createState() => _SponsorHomeViewState();
}

late NavigationServices _navigationServices;

class _SponsorHomeViewState extends State<SponsorHomeView> {
  //Defining Global Key to open the Drawer:
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  late AuthService _authService;
  String? sponsorName, sponsorEmail, sponsorImageLink;

  _initializeValues() async {
    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();

    sponsorName = await _authService.getSponsorName();
    sponsorEmail = await _authService.getSponsorEmail();
    sponsorImageLink = await _authService.getSponsorImageLink();
  }

  @override
  void initState() {
    super.initState();

    final GetIt getIt = GetIt.instance;
    _navigationServices = getIt.get<NavigationServices>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider =
          Provider.of<DashboardUserProvider>(context, listen: false);
      await provider.setUsername();
      await provider.setPassword();
      await provider.setToken();
      await provider.loginUserDashboard(context);

      final provider1 =
          Provider.of<UserRadigonePointViewModel>(context, listen: false);
      await provider1.setUsername();
      await provider1.setPassword();
      await provider1.setToken();
      await provider1.fetchUserRadigonePoint(context);

      final provider2 =
          Provider.of<UserPointsViewModel>(context, listen: false);
      await provider2.setUsername();
      await provider2.setMobile();
      await provider2.fetchUserPoints(context);
    });
    _initializeValues();
  }

  Future<void> _onRefresh() async {
    // await Future.delayed(const Duration(seconds: 2));

    final provider = Provider.of<DashboardUserProvider>(context, listen: false);
    await provider.setUsername();
    await provider.setPassword();
    await provider.setToken();
    await provider.loginUserDashboard(context);

    final provider1 =
        Provider.of<UserRadigonePointViewModel>(context, listen: false);
    await provider1.setUsername();
    await provider1.setPassword();
    await provider1.setToken();
    await provider1.fetchUserRadigonePoint(context);

    final provider2 = Provider.of<UserPointsViewModel>(context, listen: false);
    await provider2.setUsername();
    await provider2.setMobile();
    await provider2.fetchUserPoints(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      // drawer:  SponsorSideBarView(sponsorName: sponsorName,sponsorEmail: sponsorEmail,sponsorProfileImageLink: sponsorImageLink,),

      drawer: FutureBuilder(
          future: _initializeValues(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return const SponsorSideBarView(
                sponsorName: "Fetching..",
                sponsorEmail: "Fetching..",
                sponsorProfileImageLink: null,
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return const SponsorSideBarView(
                sponsorName: "Error..",
                sponsorEmail: "Error..",
                sponsorProfileImageLink: null,
              );
            }
            return SponsorSideBarView(
              sponsorName: 'Hi $sponsorName',
              sponsorEmail: sponsorEmail,
              sponsorProfileImageLink: null,
            );
          }),

      body: buildUI(),
    );
  }

  Widget buildUI() {
    return Stack(
      children: [
        const LowerBackgroundDesign(),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3.75,
          decoration: const BoxDecoration(
              gradient: MyColorScheme.yellowLinearGradient,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: RefreshIndicator(
                backgroundColor: Colors.black,
                color: Colors.white,
                displacement: 40,
                strokeWidth: 1.5,
                onRefresh: _onRefresh,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //To show the Status of the Account
                      const AccountStatus(), //To show App Bar of the app:
                      headerText(),

                      //MainContainers:
                      mainOutlinedContainer(context),
                      _monthlyCampaignResponse(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  //This is Header with hamburger icon App logo and coins details
  Widget headerText() {
    return Container(
      // color: Colors.purple,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 45,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hamburger:
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _drawerKey.currentState!.openDrawer();
                    //implement drawer Functionality:
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    // color:Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset("images/hamburger.svg"),
                  ),
                ),
              ),

              //Radigone Icon:

              Expanded(
                flex: 4,
                child: Image.asset(
                  "images/splash_logo.png",
                  height: 23,
                ),
              ),

              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 12,
                      color: Colors.transparent,
                      width: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 15,
                // alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(right: 10, left: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<UserPointsViewModel>(
                          builder: (context, providerValue, _) {
                        switch (providerValue.userPointsViewModel.status) {
                          case Status.LOADING:
                            return const Text(
                              'Fetching..',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            );

                          case Status.ERROR:
                            return const Text(
                              'Error',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            );
                          case Status.COMPLETED:
                            return Text(
                              providerValue.userPointsViewModel.data!.data
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            );
                          case null:
                            return const Text(
                              "Null",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            );
                        }
                      }),
                    ],
                  ),
                ),
              ),
              Container(
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(180)),
                child: Image.asset("images/coin.png"),
                // child: SvgPicture.asset("images/coin.svg"),
              )
            ],
          )
        ],
      ),
    );
  }
}

// This is the Main Container which stores the information of the Total Balance and ... Completed Survey etc....
Widget mainOutlinedContainer(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 25),
    // height: MediaQuery.sizeOf(context).height * 0.42,
    width: MediaQuery.sizeOf(context).width / 1.15,
    // color: Colors.blue.withOpacity(0.5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Total Balance and Total Deposit
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Total Balance container
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nBalance",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nBalance",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nBalance",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalWithdraw
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nBalance",
                      containerValue: "Null");
              }
            }),

            //completed Deposit Container:
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nDeposit",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nDeposit",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nDeposit",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalWithdraw
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/total_balance.svg"),
                      iconRadius: 180,
                      text: "Total\nDeposit",
                      containerValue: "Null");
              }
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        // Total Transaction and Total Approved Campaign
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset('images/data_transfer.svg'),
                      iconRadius: 180,
                      text: "Total\nTransaction",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset('images/data_transfer.svg'),
                      iconRadius: 180,
                      text: "Total\nTransaction",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset('images/data_transfer.svg'),
                      iconRadius: 180,
                      text: "Total\nTransaction",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalWithdraw
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset('images/data_transfer.svg'),
                      iconRadius: 180,
                      text: "Total\nTransaction",
                      containerValue: "Null");
              }
            }),

            //completed Approved Campaign Container:
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Approved\nCampaign",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Approved\nCampaign",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Approved\nCampaign",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalTransaction
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Approved\nCampaign",
                      containerValue: "Null");
              }
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        //Pending Campaign and Rejected Campaign
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Pending Campaign
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Pending\nCampaign",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Pending\nCampaign",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Pending\nCampaign",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalTransaction
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Pending\nCampaign",
                      containerValue: "Null");
              }
            }),

            //and Rejected Campaign
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Rejected\nCampaign",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Rejected\nCampaign",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Rejected\nCampaign",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalTransaction
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/completed_survey.svg"),
                      iconRadius: 180,
                      text: "Total Rejected\nCampaign",
                      containerValue: "Null");
              }
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        //Bought Views and pending Views
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Total Withdraw container
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Bought\nViews",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Bought\nViews",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Bought\nViews",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalWithdraw
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Bought\nViews",
                      containerValue: "Null");
              }
            }),

            //completed Transaction Container:
            Consumer<UserRadigonePointViewModel>(
                builder: (context, providerValue, _) {
              switch (providerValue.userRadigonePointViewModel.status) {
                case Status.LOADING:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Pending\nViews",
                      containerValue: "Fetching..");

                case Status.ERROR:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Pending\nViews",
                      containerValue: "Error");
                case Status.COMPLETED:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Pending\nViews",
                      containerValue: providerValue
                          .userRadigonePointViewModel.data!.totalTransaction
                          .toString());
                case null:
                  return DashboardInformationContainer(
                      icon: SvgPicture.asset("images/view.svg"),
                      iconRadius: 180,
                      text: "Pending\nViews",
                      containerValue: "Null");
              }
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        Consumer<UserRadigonePointViewModel>(
            builder: (context, providerValue, _) {
          switch (providerValue.userRadigonePointViewModel.status) {
            case Status.LOADING:
              return DashboardInformationContainer_1(
                  icon: SvgPicture.asset("images/view.svg"),
                  iconRadius: 180,
                  text: "Total\nViews",
                  containerValue: "Fetching..");

            case Status.ERROR:
              return DashboardInformationContainer_1(
                  icon: SvgPicture.asset("images/view.svg"),
                  iconRadius: 180,
                  text: "Total\nViews",
                  containerValue: "Error");
            case Status.COMPLETED:
              return DashboardInformationContainer_1(
                  icon: SvgPicture.asset("images/view.svg"),
                  iconRadius: 180,
                  text: "Total\nViews",
                  containerValue: providerValue
                      .userRadigonePointViewModel.data!.totalTransaction
                      .toString());
            case null:
              return DashboardInformationContainer_1(
                  icon: SvgPicture.asset("images/view.svg"),
                  iconRadius: 180,
                  text: "Total\nViews",
                  containerValue: "Null");
          }
        }),
      ],
    ),
  );
}

Widget _monthlyCampaignResponse(BuildContext context) {
  return Column(
    children: [
      //Constant Text:
      Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Monthly Campaign Response",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
      const SizedBox(
        height: 10,
      ),
      Material(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(0.3),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(180),
            ),
          ),
        ),
      )
    ],
  );
}
