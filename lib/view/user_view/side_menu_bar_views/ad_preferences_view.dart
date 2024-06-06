import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/ads_preferences_viewModel.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_header.dart';

class AdsPreferencesView extends StatefulWidget {
  const AdsPreferencesView({super.key});

  @override
  State<AdsPreferencesView> createState() => _AdsPreferencesViewState();
}

class _AdsPreferencesViewState extends State<AdsPreferencesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: _buildUI(context),
    );
  }


  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        const LowerBackgroundDesign(),
        const UpperBackgroundDesign(),
        CustomHeaderWithBackButton(
          title: "Ads Preferences",
        ),
        Consumer<AdsPreferencesViewModel>(builder: (context, provider, _) {
          return provider.isLoading
              ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 1.5,
            ),
          )
              :
          Container(
              margin: const EdgeInsets.only(top: 120, bottom: 10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
          children: []
          )));
        })
      ],
    );
  }


}
