// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
//
// import '../color_scheme.dart';
// import '../services/navigation_services.dart';
// import '../widgets/custom_button.dart';
// import '../widgets/custom_form_field.dart';
//
// class ResetPassword extends StatefulWidget {
//   const ResetPassword({super.key});
//
//   @override
//   State<ResetPassword> createState() => _ResetPasswordState();
// }
//
// class _ResetPasswordState extends State<ResetPassword> {
//   final GetIt _getIt = GetIt.instance;
//
//   late NavigationServices _navigationServices;
//
//   @override
//   void initState() {
//     _navigationServices = _getIt.get<NavigationServices>();
//
//     super.initState();
//   }
//
//   bool _confirmPasswordObscure = true;
//   final ValueNotifier<bool> _confirmPassword = ValueNotifier<bool>(false);
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
//                   "RESET PASSWORD",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                       color: Color(0xff9C9DA1)),
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
//                           child: Form(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     headerText(),
//                                     SizedBox(
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               30,
//                                     ),
//                                     SizedBox(
//                                         width: 294,
//                                         child: CustomFormField(
//                                             hintText: "New Password",
//                                             textCapitalization: false,
//
//                                             onSaved: (value) {},
//                                             obscureText: false,
//                                             isNumber: false)),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     SizedBox(
//                                       width: 294,
//                                       child: ValueListenableBuilder(
//                                         valueListenable: _confirmPassword,
//                                         builder:
//                                             (context, value, Widget? child) {
//                                           return CustomFormField(
//                                             hintText: "Confirm password",
//                                             textCapitalization: false,
//
//                                             onSaved: (value) {
//                                               setState(() {});
//                                             },
//                                             obscureText:
//                                                 _confirmPasswordObscure,
//                                             isNumber: false,
//                                             icon: GestureDetector(
//                                               onTap: () {
//                                                 _confirmPassword.value =
//                                                     !_confirmPassword.value;
//                                                 _confirmPasswordObscure =
//                                                     !_confirmPasswordObscure;
//                                               },
//                                               child: _confirmPassword.value
//                                                   ? const Icon(
//                                                 CupertinoIcons.eye,
//                                                       color: Colors.white,
//                                                       // Icons.visibility,
//                                                       // color: Colors.white,
//                                                     )
//                                                   : const Icon(
//                                                 CupertinoIcons.eye_slash,
//                                                       // Icons.visibility_off,
//                                                       color: Colors.white,
//                                                     ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.of(context).size.height / 12,
//                                 ),
//                                 Column(
//                                   children: [
//                                     SizedBox(
//                                       width: 240,
//                                       child: CustomButton(
//                                           buttonName: "Save Password",
//                                           isLoading: false,
//                                           isGradient: true,
//                                           onTap: () {
//                                             //Implement save password Functionality
//
//
//                                             _navigationServices.pushReplacementNamed("/loginPage");
//                                           }),
//                                     ),
//                                     SizedBox(
//                                       width: 240,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Text(
//                                               "Go back to",
//                                               style: TextStyle(
//                                                   fontSize: 12,
//                                                   color: Colors.white
//                                                       .withOpacity(0.8),
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             GestureDetector(
//                                                 onTap: () {
//                                                   //Implement go to Register Functionality here:
//                                                   _navigationServices.pushReplacementNamed("/registrationPage");
//
//                                                 },
//                                                 child: const Text(
//                                                   " Register",
//                                                   style: TextStyle(
//                                                       color: Colors.yellow,
//                                                       fontSize: 12,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
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
//           "Your identity has been successfully \n   verified! set your new password",
//           style: TextStyle(
//               color: Colors.white.withOpacity(0.65),
//               fontSize: 14,
//               fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//   );
// }
