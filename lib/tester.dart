// import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
// import 'package:flutter/material.dart';
// import 'package:radigone_v3/view/sponsor_view/sponser_Authentication/sponsor_registration_form_view.dart';
//
// class SponsorRegistrationView extends StatefulWidget {
//   const SponsorRegistrationView({super.key});
//
//   @override
//   State<SponsorRegistrationView> createState() => _SponsorRegistrationViewState();
// }
//
// class _SponsorRegistrationViewState extends State<SponsorRegistrationView> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final textStyle = Theme.of(context).textTheme.bodyLarge;
//     final selectedTextStyle = textStyle?.copyWith(fontWeight: FontWeight.bold);
//
//     return DefaultTabController(length: 2, child: Scaffold(
// body: SafeArea(
//   bottom: false,
//   child: Stack(
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SegmentedTabControl(
//           // Customization of widget
//           tabTextColor: Colors.black,
//           selectedTabTextColor: Colors.white,
//           indicatorPadding: const EdgeInsets.all(4),
//           squeezeIntensity: 2,
//           tabPadding: const EdgeInsets.symmetric(horizontal: 8),
//           textStyle: textStyle,
//           selectedTextStyle: selectedTextStyle,
//           // Options for selection
//           // All specified values will override the [SegmentedTabControl] setting
//           tabs: [
//             SegmentTab(
//               label: 'ACCOUNT',
//               // For example, this overrides [indicatorColor] from [SegmentedTabControl]
//               color: Colors.red.shade300,
//               backgroundColor: Colors.red.shade100,
//             ),
//             SegmentTab(
//               label: 'HOME',
//               backgroundColor: Colors.blue.shade100,
//               color: Colors.blue.shade300,
//             ),
//           ],
//         ),
//       ),
//       // Sample pages
//       Padding(
//         padding: const EdgeInsets.only(top: 70),
//         child: TabBarView(
//           physics: const BouncingScrollPhysics(),
//           children: [
//             SponsorRegistrationView(),
//             SponsorRegistrationView(),
//
//           ],
//         ),
//       )
//     ],
//   ),
// ),
//     ));
//   }
// }
//

