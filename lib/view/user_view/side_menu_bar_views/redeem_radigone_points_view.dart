// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:radigone_v3/resources/components/background_designs.dart';
// import 'package:radigone_v3/resources/components/custom_header.dart';
// import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/redeem_radigonePoints_viewModel.dart';
//
// import '../../../resources/colors.dart';
// import '../../../resources/components/custom_button.dart';
// import '../../../resources/components/custom_form_field.dart';
//
// class RedeemRadigonePoints extends StatefulWidget {
//   const RedeemRadigonePoints({super.key});
//
//   @override
//   State<RedeemRadigonePoints> createState() => _RedeemRadigonePointsState();
// }
//
// class _RedeemRadigonePointsState extends State<RedeemRadigonePoints> {
//
//   late GlobalKey<FormState> _redeemRadigonePointsFormKey;
//
//   @override
//   void initState() {
//     super.initState();
//     _redeemRadigonePointsFormKey = GlobalKey<FormState>();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildUI(context),
//     );
//
//   }
//   Widget _buildUI(BuildContext context) {
//     return Stack(
//       children: [
//         // Container(
//         //   height: double.infinity,
//         //   decoration: const BoxDecoration(color: MyColorScheme.lightGrey0),
//         // ),
//         // Container(
//         //   width: double.infinity,
//         //   height: MediaQuery.of(context).size.height / 8,
//         //   decoration: const BoxDecoration(
//         //       gradient: MyColorScheme.yellowLinearGradient,
//         //       borderRadius:
//         //       BorderRadius.vertical(bottom: Radius.elliptical(150, 40))),
//         // ),
//         LowerBackgroundDesign(),
//         UpperBackgroundDesign(),
//         CustomHeaderWithBackButton(title: "Redeem Points",),
//
//
//         Container(
//           height: double.infinity,
//           width: double.infinity,
//           margin: const EdgeInsets.only(top: 100, bottom: 50),
//           padding: const EdgeInsets.only(left: 30, right: 30),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 500,
//                   child: Consumer<RedeemRadigonePointsViewModel>(
//                       builder: (context, provider, Widget? child) {
//                         return SizedBox(
//                             height: double.infinity,
//                             width: double.infinity,
//                             child: Center(
//                                 child: Material(
//                                     color: MyColorScheme.authContainerColor.withOpacity(0.8),
//                                     borderRadius: BorderRadius.circular(24),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(24)),
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             vertical:
//                                             MediaQuery.of(context).size.height * 0.04,
//                                             horizontal:
//                                             MediaQuery.of(context).size.width * 0.05),
//                                         child: SingleChildScrollView(
//                                           child: Form(
//                                             key: _redeemRadigonePointsFormKey,
//                                             child: Column(
//                                               mainAxisSize: MainAxisSize.min,
//                                               mainAxisAlignment: MainAxisAlignment.center,
//                                               crossAxisAlignment: CrossAxisAlignment.center,
//                                               children: [
//                                                 Column(
//                                                   mainAxisSize: MainAxisSize.max,
//                                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                                   children: [
//                                                     SizedBox(
//                                                         width: 294,
//                                                         child: CustomFormField(
//                                                           hintText: "Radigone Points",
//                                                           onSaved: (value) {
//                                                             provider.setPointsRedeemed(value.toString());
//                                                           },
//                                                           obscureText: false,
//                                                           isNumber: true,
//                                                           textCapitalization: false,)),
//                                                     const SizedBox(height: 15),
//                                                     SizedBox(
//                                                       width: 294, // height: 30,
//                                                       child: CustomFormField(
//                                                         hintText: "Description",
//                                                         onSaved: (value) {
//                                                           provider.setDescription(value.toString());
//                                                         },
//                                                         obscureText: false,
//                                                         isNumber: false,
//                                                         textCapitalization: false,),),
//                                                     const SizedBox(
//                                                       height: 8,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height:
//                                                   MediaQuery.of(context).size.height / 12,
//                                                 ),
//                                                 Column(
//                                                   children: [
//                                                     SizedBox(
//                                                       width: 240,
//                                                       child: CustomButton(
//                                                           buttonName: "Redeem",
//                                                           isLoading: provider.isLoading,
//                                                           isGradient: true,
//                                                           onTap: () async {
//                                                             //Implement Login Functionality
//
//                                                             if (_redeemRadigonePointsFormKey.currentState!
//                                                                 .validate()) {
//                                                               //saving the username and password:
//                                                               _redeemRadigonePointsFormKey.currentState!
//                                                                   .save();
//
//                                                               provider.redeemRadigonePoints(context);
//
//                                                             }
//                                                           }),
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ))));
//                       }),
//                 ),
//
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   // Widget header(BuildContext context) {
//   //   return Material(
//   //     elevation: 1,
//   //     borderRadius: BorderRadius.circular(12),
//   //     child: Container(
//   //       width: MediaQuery.sizeOf(context).width * 0.9,
//   //       height: MediaQuery.sizeOf(context).width * 0.15,
//   //       decoration: BoxDecoration(
//   //         color: Colors.black,
//   //         borderRadius: BorderRadius.circular(12),
//   //       ),
//   //       child: const Row(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         crossAxisAlignment: CrossAxisAlignment.center,
//   //         children: [
//   //           Text(
//   //             "Redeem Radigone Points",
//   //             style: TextStyle(
//   //                 color: Colors.white,
//   //                 fontSize: 20,
//   //                 fontWeight: FontWeight.w600),
//   //           )
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }
//
//
//
//
