

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/colors.dart';
import 'package:radigone_v3/resources/components/custom_checkbox_tile.dart';
import 'package:radigone_v3/resources/components/custom_textIcon_button.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/ads_preferences_viewModel.dart';

import '../../../data/response/status.dart';
import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_header.dart';

class AdsPreferencesView extends StatefulWidget {
  const AdsPreferencesView({super.key});

  @override
  State<AdsPreferencesView> createState() => _AdsPreferencesViewState();
}

class _AdsPreferencesViewState extends State<AdsPreferencesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeValues();
    });
  }

  Future<void> _initializeValues() async {
    final provider = Provider.of<UserAdsPreferencesViewModel>(context, listen: false);
    await provider.fetchAllAdsPreferences(context: context);
    await provider.fetchSelectedAdsPreferences(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LowerBackgroundDesign(),
          const UpperBackgroundDesign(),
          const CustomHeaderWithBackButton(title: "Ads Preferences"),
          Consumer<UserAdsPreferencesViewModel>(
            builder: (context, provider, _) {
              return provider.isLoading
                  ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                ),
              )
                  : _buildContent(context, provider);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, UserAdsPreferencesViewModel provider) {
    return Container(
      margin: const EdgeInsets.only(top: 120, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            _buildAdsPreferences(provider),
            const SizedBox(height: 30),
            _buildSubmitButton(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildAdsPreferences(UserAdsPreferencesViewModel provider) {
    switch (provider.allAdsPreferences.status) {
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1.5,
          ),
        );

      case Status.ERROR:
        return const Text(
          'Some Error Occurred',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        );

      case Status.COMPLETED:
        return _buildAdsGrid(provider);

      default:
        return const Text(
          "Null",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        );
    }
  }

  Widget _buildAdsGrid(UserAdsPreferencesViewModel provider) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 2.5,
        childAspectRatio: 5.2,
      ),
      itemCount: provider.allAdsState.length,
      itemBuilder: (context, index) {
        var title = provider.allAdsState[index]['name'];
        var isChecked = provider.allAdsState[index]['isChecked'];

        return CustomCheckBoxTile(
          isChecked: isChecked,
          title: title,
          onChanged: (bool? value) {
            provider.updateAdState(index);
          },
        );
      },
    );
  }

  Widget _buildSubmitButton(UserAdsPreferencesViewModel provider) {
    return SizedBox(
      width: 120,
      child: CustomTextIconButton(
        elevation: 2,
        gradient: MyColorScheme.yellowLinearGradient,
        text: "Submit",
        textColor: Colors.black,
        icon: const Icon(
          Icons.send,
          color: Colors.black,
        ),
        onTap: () async {
          await provider.submitData();
        },
      ),
    );
  }
}
