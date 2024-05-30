// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:pinput/pinput.dart';
// import 'package:radigone_v2/widgets/custom_button.dart';
//
// import '../color_scheme.dart';
// import '../services/navigation_services.dart';
//
// //creating empty otp initially
// String otp = "";
//
// class OtpVerification extends StatefulWidget {
//   String? widgetScnerio;
//
//    OtpVerification({super.key,  this.widgetScnerio});
//
//   @override
//   State<OtpVerification> createState() => _OtpVerificationState();
// }
//
// class _OtpVerificationState extends State<OtpVerification> {
//
//   final GetIt _getIt = GetIt.instance;
//
//   late NavigationServices _navigationServices;
//
//   late GlobalKey<FormState> _otpFormGlobalKey;
//
//   @override
//   void initState() {
//
//     print("----------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${widget.widgetScnerio}");
//     _navigationServices = _getIt.get<NavigationServices>();
//
//     _otpFormGlobalKey = GlobalKey<FormState>();
//     otp = '';
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     setState(() {
//       otp = '';
//     });
//     super.dispose();
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
//
//
//     //defining the pinTheme:
//     final defaultPintheme = PinTheme(
//       width: 44,
//       height: 44,
//       textStyle: const TextStyle(
//           fontSize: 18, color: Colors.white),
//
//       decoration: BoxDecoration(
//          color:  Colors.black.withOpacity(0.3),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.transparent)
//
//       )
//     );
//
//     return Stack(
//       children: [
//         Container(
//           height: double.infinity,
//           decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
//         ),
//         Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height / 2.5,
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
//                   "OTP VERIFICATION",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Container(
//           margin:
//               EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
//           child: Center(
//             child: Material(
//               color: MyColorScheme.authContainerColor.withOpacity(0.8),
//               borderRadius: BorderRadius.circular(24),
//               child: Container(
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(24)),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: MediaQuery.of(context).size.height * 0.04,
//                       horizontal: MediaQuery.of(context).size.width * 0.05),
//                   child: SingleChildScrollView(
//                     child: Form(
//                       key: _otpFormGlobalKey,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           headerInfoText(),
//                           SizedBox(
//                             width: 236,
//                               height: MediaQuery.of(context).size.width*0.2,
//                               child: Pinput(
//                                 length: 4,
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 defaultPinTheme: defaultPintheme,
//                                 focusedPinTheme: defaultPintheme.copyWith(
//                                     decoration: defaultPintheme.decoration!.copyWith(
//                                         border: Border.all(color: Colors.green)
//                                     )
//                                 ),
//                                 // onCompleted: (pin) => debugPrint(pin),
//                                 onCompleted: (pin) {
//                                   //When password is filled completely perform operations and then move to the reset password Screen:
//                                   // if we are at signup page verification then need to go to the login Screen
//
//
//                                   widget.widgetScnerio == 'registration' ? _navigationServices.pushReplacementNamed("/loginPage"):_navigationServices.pushReplacementNamed("/resetPassword");
//
//                                 },
//
//
//                               )
//                           ),
//
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height/12,
//                           ),
//
//                           Column(
//                             children: [
//                               SizedBox(
//                                 width: 240,
//                                 child: CustomButton(
//                                     buttonName: "Get OTP",
//                                     isLoading: false,
//                                     isGradient: true,
//                                     onTap: () async {
//                                       //No need this is just for reading purpose:
//                                       // if (_otpFormGlobalKey.currentState!
//                                       //     .validate()) {
//                                       //   //Make sure that otp value is clear:
//                                       // //   otp = '';
//                                       // //
//                                       // //   print("Validating the fields");
//                                       // //   //Saving the values in String otp:
//                                       // //   _otpFormGlobalKey.currentState!.save();
//                                       // //
//                                       // //   print(
//                                       // //       "----------------------value in otp is: $otp");
//                                       // //
//                                       // //   if (otp.length == 4) {
//                                       // //     //perform backEnd from here:
//                                       // //   }
//                                       // //
//                                       // //   //When everything is ok then assign otp to empty:
//                                       // //   otp = '';
//                                       //
//                                       // }
//                                     }
//                                       ),
//                               ),
//
//                               SizedBox(
//                                 width: 240,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text("Don't receive OTP?",style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8),fontWeight: FontWeight.bold),),
//                                       GestureDetector(
//                                           onTap: (){
//                                             //Implement resend Functionality here:
//                                           },
//                                           child: const Text(" Resend OTP",style: TextStyle(color: Colors.yellow,fontSize: 12,fontWeight: FontWeight.bold),))
//                                     ],
//                                   ),
//                                 ),
//                               )
//
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
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
//
// Widget headerInfoText() {
//   return SizedBox(
//     width: 294,
//     child: Column(
//       children: [
//         Text(
//           "We will send you a verification code to",
//           style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 14),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "this number:",
//               style: TextStyle(
//                   color: Colors.white.withOpacity(0.65), fontSize: 14),
//             ),
//             const Text(
//               " 91-8091771052",
//               style: TextStyle(color: Colors.white, fontSize: 15),
//             )
//           ],
//         )
//       ],
//     ),
//   );
// }
//
//
// //This is just for the testing purpose, this is not used in the development:
// //
// //
// // Widget otpTextFormField({
// //   required BuildContext context,
// //   required void Function(String? value) onSaved,
// // }) {
// //   return SizedBox(
// //     height: 44,
// //     width: 44,
// //     child: TextFormField(
// //       onSaved: onSaved,
// //       validator: (value) {
// //         if (value != null && value.isNotEmpty) {
// //           return null;
// //         } else {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(content: Text("kindly enter 4 digit password")));
// //           return null;
// //         }
// //       },
// //       decoration: InputDecoration(
// //         border: OutlineInputBorder(
// //             borderSide: BorderSide.none,
// //             borderRadius: BorderRadius.circular(8)),
// //         filled: true,
// //         fillColor: Colors.black.withOpacity(0.3),
// //         contentPadding: EdgeInsets.zero,
// //       ),
// //       style: const TextStyle(fontSize: 18, color: Colors.white),
// //       keyboardType: TextInputType.number,
// //       inputFormatters: [
// //         LengthLimitingTextInputFormatter(1),
// //         FilteringTextInputFormatter.digitsOnly
// //       ],
// //       textAlign: TextAlign.center,
// //       onChanged: (value) {
// //         otp += value;
// //         print(
// //             "-------------------->>>>>>>>>>>>>>>>>>>>>>Printing the otp length ${otp.length}");
// //
// //         if (otp.length < 4 && value.length == 1) {
// //           print(otp.length);
// //           FocusScope.of(context).nextFocus();
// //         }
// //       },
// //     ),
// //   );
// // }
