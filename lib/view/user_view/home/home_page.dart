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
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
//
//
//
//
// class _HomePageState extends State<HomePage> {
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
// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
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
import 'package:radigone_v3/resources/components/background_designs.dart';
import 'package:radigone_v3/view/common_view/video_player_view.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import 'package:radigone_v3/view_model/user_view_model/radigonePoint_view_model.dart';
import 'package:radigone_v3/view_model/user_view_model/user_points_view_model.dart';

import '../../../data/response/status.dart';
import '../../../resources/colors.dart';
import '../../../resources/components/account_Status.dart';
import '../../../resources/components/dashboard_info_container.dart';
import '../../../view_model/services/auth_services.dart';
import '../../../view_model/user_view_model/dashboard_ads_list_view_model.dart';
import '../user_side_menubar.dart';
import 'Ad_Container.dart';
import 'Ad_Specification_with_download.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late NavigationServices _navigationServices;

class _HomePageState extends State<HomePage> {
  //Defining Global Key to open the Drawer:
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  late AuthService _authService;

  String? _userName, _userEmail, _userImageLink;
  Future<void> _initializeValues() async {
    final GetIt getIt = GetIt.instance;
    _authService = getIt.get<AuthService>();

    _userName = await _authService.getUserName();
    _userEmail = await _authService.getUserEmail();
    _userImageLink = await _authService.getUserImageLink();
  }

  @override
  void initState() {
    super.initState();

    // _initialRadigonePointsData = _initializeData();

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
    print("Build");

    return Scaffold(
      key: _drawerKey,
      drawer: FutureBuilder(
          future: _initializeValues(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return const UserSideBar(
                userName: "Fetching..",
                userEmail: "Fetching..",
                userProfileImageLink: null,
              );
            }
            if (snapshot.hasError) {
              return const UserSideBar(
                userName: "Error..",
                userEmail: "Error..",
                userProfileImageLink: null,
              );
            }
            return UserSideBar(
              userName: 'Hi $_userName', userEmail: _userEmail,
              // userProfileImageLink: _userImageLink,
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
          height: MediaQuery.of(context).size.width * 0.5,
          decoration: const BoxDecoration(
              gradient: MyColorScheme.yellowLinearGradient,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              // height: double.infinity,
              // width: double.infinity,
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

                      const SizedBox(
                        height: 10,
                      ),

                      //MainContainers:
                      mainOutlinedContainer(context),

                      //Ads Section:
                      AdsSection(context),
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
      height: 37,
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
                    width: 20,
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Total Balance container:
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
                        .userRadigonePointViewModel.data!.user!.balance!);
              case null:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_balance.svg"),
                    iconRadius: 180,
                    text: "Total\nBalance",
                    containerValue: "Null");
            }
          }),

          //Completed Survey container:
          Consumer<UserRadigonePointViewModel>(
              builder: (context, providerValue, _) {
            switch (providerValue.userRadigonePointViewModel.status) {
              case Status.LOADING:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/completed_survey.svg"),
                    iconRadius: 2,
                    text: "Completed\nSurvey",
                    containerValue: "Fetching..");

              case Status.ERROR:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/completed_survey.svg"),
                    iconRadius: 2,
                    text: "Completed\nSurvey",
                    containerValue: "Error");
              case Status.COMPLETED:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/completed_survey.svg"),
                    iconRadius: 2,
                    text: "Completed\nSurvey",
                    containerValue: providerValue
                        .userRadigonePointViewModel.data!.user!.completedSurvey
                        .toString());
              case null:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/completed_survey.svg"),
                    iconRadius: 2,
                    text: "Completed\nSurvey",
                    containerValue: "Null");
            }
          }),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Total Withdraw container
          Consumer<UserRadigonePointViewModel>(
              builder: (context, providerValue, _) {
            switch (providerValue.userRadigonePointViewModel.status) {
              case Status.LOADING:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_withdraw.svg"),
                    iconRadius: 180,
                    text: "Total\nWithdraw",
                    containerValue: "Fetching..");

              case Status.ERROR:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_withdraw.svg"),
                    iconRadius: 180,
                    text: "Total\nWithdraw",
                    containerValue: "Error");
              case Status.COMPLETED:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_withdraw.svg"),
                    iconRadius: 180,
                    text: "Total\nWithdraw",
                    containerValue: providerValue
                        .userRadigonePointViewModel.data!.totalWithdraw
                        .toString());
              case null:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset("images/total_withdraw.svg"),
                    iconRadius: 180,
                    text: "Total\nWithdraw",
                    containerValue: "Null");
            }
          }),

          //completed Transaction Container:
          Consumer<UserRadigonePointViewModel>(
              builder: (context, providerValue, _) {
            switch (providerValue.userRadigonePointViewModel.status) {
              case Status.LOADING:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset('images/data_transfer.svg'),
                    iconRadius: 180,
                    text: "Completed\nTransaction",
                    containerValue: "Fetching..");

              case Status.ERROR:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset('images/data_transfer.svg'),
                    iconRadius: 180,
                    text: "Completed\nTransaction",
                    containerValue: "Error");
              case Status.COMPLETED:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset('images/data_transfer.svg'),
                    iconRadius: 180,
                    text: "Completed\nTransaction",
                    containerValue: providerValue
                        .userRadigonePointViewModel.data!.totalTransaction
                        .toString());
              case null:
                return DashboardInformationContainer(
                    icon: SvgPicture.asset('images/data_transfer.svg'),
                    iconRadius: 180,
                    text: "Completed\nTransaction",
                    containerValue: "Null");
            }
          }),
        ],
      ),
    ],
  );
}

// Specified Ads Screen
Widget AdsSection(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //Showing the Ad_specification: Upcoming specified:
      AdSpecification(
        specificationName: "Upcoming Next",
        onTap: () {},
      ),

      Consumer<DashboardUserProvider>(
          builder: (context, providerValue, Widget? child) {
        switch (providerValue.adsList.status) {
          case Status.LOADING:
            return SizedBox(
                height: MediaQuery.of(context).size.width * 0.60,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ),
                ));

          case Status.ERROR:
            return SizedBox(
                height: MediaQuery.of(context).size.width * 0.60,
                child: const Center(
                    child: Text('Check Your Internet Connection')));
          case Status.COMPLETED:
            return SizedBox(
              height: MediaQuery.of(context).size.width * 0.60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // itemCount: UserDashboardModelObject.userDashboard.data?.length,
                  itemCount: providerValue.adsList.data!.data!.length,
                  itemBuilder: (context, index) {
                    var item = providerValue.adsList.data!.data?[index];
                    return Container(
                        margin: const EdgeInsets.only(right: 13),
                        child: AdContainer(
                          imageUrl: 'https://radigone.com${item?.image}',
                          title: item?.name,
                          subtitle: item?.pSpecification,
                          radigonePoints: item?.pMrp,
                          onTap: () {
                            _navigationServices.push(MaterialPageRoute(
                                builder: (context) => VideoPlayerPage(
                                      videoUrl: item?.videoUrl,
                                      thumbnail:
                                          'https://radigone.com${item?.image}',
                                    )));
                          },
                        ));
                  }),
            );

          case null:
            return const Text('Null Value Returned');
        }
      }),

      // Currently of No Use so Commented.
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),

      //Showing the Ad_specification: Upcoming specified:
      AdSpecification(
        specificationName: "Birthday Month",
        onTap: () {},
      ),

      SizedBox(
        height: MediaQuery.of(context).size.width * 0.60,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(right: 13),
                  child: AdContainer(
                    onTap: () {},
                  ));
            }),
      ),

      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),

      //Showing the Ad_specification: Anniversary specified:
      AdSpecification(
        specificationName: "Anniversary Month",
        onTap: () {},
      ),

      SizedBox(
        height: MediaQuery.of(context).size.width * 0.60,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(right: 13),
                  child: AdContainer(
                    onTap: () {},
                  ));
            }),
      ),
    ],
  );
}
