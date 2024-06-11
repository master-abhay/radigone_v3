import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/custom_deposit_log_tile.dart';
import 'package:radigone_v3/view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_deposit_viewModel.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_header.dart';
import '../../../resources/components/custom_transaction_tile.dart';
import '../../../view_model/sponsor_view_model/sponsor_sidebar_view_models/sponsor_transaction_viewModel.dart';

class SponsorTransactionView extends StatefulWidget {
  const SponsorTransactionView({super.key});

  @override
  State<SponsorTransactionView> createState() => _SponsorTransactionViewState();
}

class _SponsorTransactionViewState extends State<SponsorTransactionView> {

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
          title: "Transactions",
        ),
        Consumer<SponsorHistoryViewModel>(builder: (context, provider, _) {
          return Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 120, bottom: 0),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return CustomTransactionTile(
                                  transactionId: "KQPPK7813E",
                                  transactionType: "+",
                                  username: "AbhayKumar11",
                                  date: '12 JULY 2023',
                                  day: "Monday",
                                  amount: "100000",
                                  status: "Failed",
                                  onTap: () {});
                            })
                      ])));
        })
      ],
    );
  }
}
