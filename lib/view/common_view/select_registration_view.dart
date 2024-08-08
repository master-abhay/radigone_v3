// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:radigone_v3/view/user_view/user_authentication_view/viewer_registration_view.dart';
//
// import '../../resources/colors.dart';
// import '../../resources/components/custom_button.dart';
// import '../../view_model/services/navigation_services.dart';
//
// class SelectRegistrationPage extends StatefulWidget {
//   const SelectRegistrationPage({super.key});
//
//   @override
//   State<SelectRegistrationPage> createState() => _SelectRegistrationPageState();
// }
//
// class _SelectRegistrationPageState extends State<SelectRegistrationPage> {
//   bool isLoadingViewer = false;
//   bool isLoadingSponsor = false;
//   bool isLoadingAgent = false;
//
//   late NavigationServices _navigationServices;
//
//   final GetIt _getIt = GetIt.instance;
//
//   @override
//   void initState() {
//     _navigationServices = _getIt.get<NavigationServices>();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: _buildUI(),
//     );
//   }
//
//   Widget _buildUI() {
//     return Stack(
//       children: [
//         Container(
//           height: double.infinity,
//           decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
//         ),
//         Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height / 2.6,
//           decoration: const BoxDecoration(
//               gradient: MyColorScheme.yellowLinearGradient,
//               borderRadius:
//                   BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
//           child: Image.asset("images/login_registraion.png"),
//         ),
//         Container(
//           margin: EdgeInsets.fromLTRB(
//               MediaQuery.sizeOf(context).width / 13,
//               MediaQuery.sizeOf(context).height / 3.12,
//               MediaQuery.sizeOf(context).width / 13,
//               MediaQuery.sizeOf(context).height / 5),
//           child: Center(
//             child: Material(
//               elevation: 3,
//               color: MyColorScheme.authContainerColor.withOpacity(0.4),
//               borderRadius: BorderRadius.circular(22),
//               child: Container(
//                 // height: MediaQuery.of(context).size.height/2.7,
//                 // width: 300,
//                 decoration: BoxDecoration(
//                   color: MyColorScheme.authContainerColor.withOpacity(0.4),
//                   borderRadius: BorderRadius.circular(22),
//                 ),
//
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: MediaQuery.of(context).size.width * 0.06),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: MediaQuery.sizeOf(context).height * 0.02),
//                         child: const Center(
//                           child: Text(
//                             "Welcome To\n  Radigone",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                           width: MediaQuery.of(context).size.width / 1.3,
//                           child: CustomButton(
//                               buttonName: "User Registration",
//                               isLoading: isLoadingViewer,
//                               isGradient: true,
//                               onTap: () {
//                                 setState(() {
//                                   isLoadingViewer = true;
//                                 });
//                                 _navigationServices.pushCupertino(
//                                     CupertinoPageRoute(
//                                         builder: (context) =>
//                                             const ViewerRegistrationView()));
//
//                                 setState(() {
//                                   isLoadingViewer = false;
//                                 });
//                               })),
//                       SizedBox(
//                           width: MediaQuery.of(context).size.width / 1.3,
//                           child: CustomButton(
//                               buttonName: "Sponsor Registration",
//                               isLoading: isLoadingSponsor,
//                               isGradient: false,
//                               onTap: () {
//                                 setState(() {
//                                   isLoadingSponsor = true;
//                                 });
//
//                                 _navigationServices.pushReplacementNamed(
//                                     "/sponsorRegistrationView");
//
//                                 setState(() {
//                                   isLoadingSponsor = false;
//                                 });
//                               })),
//                       SizedBox(
//                           width: MediaQuery.of(context).size.width / 1.3,
//                           child: CustomButton(
//                               buttonName: "Agent Registration",
//                               isLoading: isLoadingAgent,
//                               isGradient: false,
//                               onTap: () {
//                                 setState(() {
//                                   isLoadingAgent = true;
//                                 });
//
//                                 _navigationServices.pushReplacementNamed(
//                                     "/agentRegistrationView");
//
//                                 setState(() {
//                                   isLoadingAgent = false;
//                                 });
//                               })),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radigone_v3/view/user_view/user_authentication_view/viewer_registration_view.dart';

import '../../resources/colors.dart';
import '../../resources/components/custom_button.dart';
import '../../utils/constants.dart';
import '../../view_model/services/navigation_services.dart';
import '../sponsor_view/sponser_Authentication/sponsor_registration_view.dart';

class SelectRegistrationPage extends StatefulWidget {
  const SelectRegistrationPage({super.key});

  @override
  State<SelectRegistrationPage> createState() => _SelectRegistrationPageState();
}

class _SelectRegistrationPageState extends State<SelectRegistrationPage> {
  bool isLoadingViewer = false;
  bool isLoadingSponsor = false;
  bool isLoadingAgent = false;

  late NavigationServices _navigationServices;

  final GetIt _getIt = GetIt.instance;

  @override
  void initState() {
    _navigationServices = _getIt.get<NavigationServices>();
    super.initState();
  }

  Future<void> _navigateToViewerRegistration() async {
    setState(() {
      isLoadingViewer = true;
    });
    await Future.delayed(const Duration(seconds: 1)); // Simulate loading delay
    _navigationServices.pushReplacementCupertino(CupertinoPageRoute(
        builder: (context) => const ViewerRegistrationView()));
    setState(() {
      isLoadingViewer = false;
    });
  }

  Future<void> _navigateToSponsorRegistration() async {
    setState(() {
      isLoadingSponsor = true;
    });
    await Future.delayed(const Duration(seconds: 1)); // Simulate loading delay
    _navigationServices.pushReplacementCupertino(CupertinoPageRoute(
        builder: (context) =>
            const SponsorRegistrationView(userType: UserType.sponsor)));
    setState(() {
      isLoadingSponsor = false;
    });
  }

  Future<void> _navigateToAgentRegistration() async {
    setState(() {
      isLoadingAgent = true;
    });
    await Future.delayed(const Duration(seconds: 1)); // Simulate loading delay
    _navigationServices.pushReplacementCupertino(CupertinoPageRoute(
        builder: (context) => const SponsorRegistrationView(
              userType: UserType.agent,
            )));
    setState(() {
      isLoadingAgent = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          height: MediaQuery.of(context).size.height / 2.6,
          decoration: const BoxDecoration(
              gradient: MyColorScheme.yellowLinearGradient,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
          child: Image.asset("images/login_registraion.png"),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
              MediaQuery.sizeOf(context).width / 13,
              MediaQuery.sizeOf(context).height / 3.12,
              MediaQuery.sizeOf(context).width / 13,
              MediaQuery.sizeOf(context).height / 5),
          child: Center(
            child: Material(
              elevation: 3,
              color: MyColorScheme.authContainerColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(22),
              child: Container(
                decoration: BoxDecoration(
                  color: MyColorScheme.authContainerColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.06),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.sizeOf(context).height * 0.02),
                        child: const Center(
                          child: Text(
                            "Welcome To\n  Radigone",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: CustomButton(
                              buttonName: "User Registration",
                              isLoading: isLoadingViewer,
                              isGradient: true,
                              onTap: _navigateToViewerRegistration)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: CustomButton(
                              buttonName: "Sponsor Registration",
                              isLoading: isLoadingSponsor,
                              isGradient: false,
                              onTap: _navigateToSponsorRegistration)),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: CustomButton(
                              buttonName: "Agent Registration",
                              isLoading: isLoadingAgent,
                              isGradient: false,
                              onTap: _navigateToAgentRegistration)),
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
}
