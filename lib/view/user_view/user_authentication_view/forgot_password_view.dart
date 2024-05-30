// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:radigone_v2/services/navigation_services.dart';
//
// import '../color_scheme.dart';
// import '../widgets/custom_button.dart';
// import '../widgets/custom_form_field.dart';
//
// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//   final GetIt _getIt = GetIt.instance;
//
//   late NavigationServices _navigationServices;
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
//           height: MediaQuery.of(context).size.height / 2.6,
//           decoration: const BoxDecoration(
//               gradient: MyColorScheme.yellowLinearGradient,
//               borderRadius:
//                   BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 35,
//                   child: Image.asset(
//                     "images/splash_logo.png",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "FORGOT PASSWORD",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//             height: double.infinity,
//             width: double.infinity,
//             child: Center(
//                 child: Material(
//                     color: MyColorScheme.authContainerColor.withOpacity(0.8),
//                     borderRadius: BorderRadius.circular(24),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(24)),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: MediaQuery.of(context).size.height * 0.04,
//                             horizontal:
//                                 MediaQuery.of(context).size.width * 0.05),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   headerText(),
//                                   SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height / 30,
//                                   ),
//                                   SizedBox(
//                                       width: 294,
//                                       child: CustomFormField(
//                                           hintText: "Phone number",
//                                           onSaved: (value) {},
//                                           obscureText: false,
//                                           isNumber: true)),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: MediaQuery.of(context).size.height / 7,
//                               ),
//                               Column(
//                                 children: [
//                                   SizedBox(
//                                     width: 240,
//                                     child: CustomButton(
//                                         buttonName: "Send OTP",
//                                         isLoading: false,
//                                         isGradient: true,
//                                         onTap: () {
//                                           //Implement Login Functionality
//                                           _navigationServices.pushReplacementNamed("/otpVerification");
//                                         }),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ))))
//       ],
//     );
//   }
// }
//
// Widget headerText() {
//   return SizedBox(
//     width: 294,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Enter your registered phone number to \n   receive password reset instruction",
//           style: TextStyle(
//               color: Colors.white.withOpacity(0.65),
//               fontSize: 14,
//               fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//   );
// }
