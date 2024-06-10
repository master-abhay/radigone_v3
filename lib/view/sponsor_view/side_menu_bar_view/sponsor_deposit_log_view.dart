import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/colors.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_deposit_viewModel.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_header.dart';

class SponsorDepositLogView extends StatefulWidget {
  const SponsorDepositLogView({super.key});

  @override
  State<SponsorDepositLogView> createState() => _SponsorDepositLogViewState();
}

class _SponsorDepositLogViewState extends State<SponsorDepositLogView> {
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
          title: "Deposit Log",
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
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 85,
                                    width: 85,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                    child: SvgPicture.asset(
                                      "images/paytm.svg",
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    height: 85,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Transaction Id",
                                          style: MyColorScheme.titleTextStyle(),
                                        ),
                                        Text("RazorPay",
                                            style: MyColorScheme
                                                .subTitleTextStyle()),
                                        Text("13 July 2024",
                                            style: MyColorScheme
                                                .subTitleTextStyle()),
                                        Text("Tuesday",
                                            style: MyColorScheme
                                                .subTitleTextStyle())
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 85,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: SvgPicture.asset(
                                              "images/coin.svg"),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "1000000000",
                                          style: MyColorScheme.titleTextStyle(),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "Complete",
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                    SizedBox(
                                      child: Material(
                                        elevation: 1,
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.transparent,
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            border:
                                            Border.all(color: Colors.white),
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            "View Details",
                                            style: TextStyle(
                                                color: MyColorScheme.lightGrey0),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ])));
        })
      ],
    );
  }
}
