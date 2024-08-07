import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/custom_button.dart';
import 'package:radigone_v3/resources/components/custom_text_field.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_deposit_viewModel.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_header.dart';

class SponsorBuyViewView extends StatefulWidget {
  const SponsorBuyViewView({super.key});

  @override
  State<SponsorBuyViewView> createState() => _SponsorBuyViewViewState();
}

class _SponsorBuyViewViewState extends State<SponsorBuyViewView> {
  FocusNode _currentFocusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

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
          title: "Buy Views",
        ),
        Consumer<SponsorDepositViewModel>(builder: (context, provider, _) {
          return Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 120, bottom: 10),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).width * 0.2,
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset('images/razorpay.svg'),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        CustomTextField(
                            currentFocusNode: _currentFocusNode,
                            controller: _textEditingController,
                            obscureText: false,
                            hintText: "Enter Amount Here",
                            textInputType: TextInputType.number,
                            onChanged: (value) {}),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            buttonName: "Deposit Now",
                            isLoading: false,
                            isGradient: true,
                            onTap: () async {})
                      ])));
        })
      ],
    );
  }
}
