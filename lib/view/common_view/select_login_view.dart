// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:radigone_v3/view/common_view/login_view.dart';
//
// import '../../resources/colors.dart';
// import '../../resources/components/custom_button.dart';
// import '../../view_model/services/navigation_services.dart';
//
// class SelectLoginPage extends StatefulWidget {
//   const SelectLoginPage({super.key});
//
//   @override
//   State<SelectLoginPage> createState() => _SelectLoginPageState();
// }
//
// class _SelectLoginPageState extends State<SelectLoginPage> {
//   bool isLoadingLogin = false;
//   bool isLoadingSignUp = false;
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
//                               buttonName: "User Login",
//                               isLoading: isLoadingLogin,
//                               isGradient: true,
//                               onTap: () {
//                                 setState(() {
//                                   isLoadingLogin = true;
//                                 });
//
//                                 // _navigationServices
//                                 //     .pushReplacementNamed("/loginPage");
//                                 _navigationServices.push(MaterialPageRoute(
//                                     builder: (context) =>
//                                         const LoginView(flagType: "viewer")));
//
//                                 setState(() {
//                                   isLoadingLogin = false;
//                                 });
//                               })),
//                       SizedBox(
//                           width: MediaQuery.of(context).size.width / 1.3,
//                           child: CustomButton(
//                               buttonName: "Sponsor Login",
//                               isLoading: isLoadingLogin,
//                               isGradient: false,
//                               onTap: () {
//                                 setState(() {
//                                   isLoadingLogin = true;
//                                 });
//
//                                 _navigationServices.push(MaterialPageRoute(
//                                     builder: (context) =>
//                                         const LoginView(flagType: "sponsor")));
//
//                                 setState(() {
//                                   isLoadingLogin = false;
//                                 });
//                               })),
//                       SizedBox(
//                           width: MediaQuery.of(context).size.width / 1.3,
//                           child: CustomButton(
//                               buttonName: "Agent Login",
//                               isLoading: isLoadingLogin,
//                               isGradient: false,
//                               onTap: () {
//                                 setState(() {
//                                   isLoadingLogin = true;
//                                 });
//
//                                 _navigationServices.push(MaterialPageRoute(
//                                     builder: (context) =>
//                                         const LoginView(flagType: "agent")));
//
//                                 setState(() {
//                                   isLoadingLogin = false;
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
