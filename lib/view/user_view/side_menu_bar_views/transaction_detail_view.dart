import 'package:flutter/material.dart';
import 'package:radigone_v3/resources/colors.dart';

import '../../../resources/components/background_designs.dart';
import '../../../resources/components/custom_header.dart';

class TransactionDetailView extends StatefulWidget {
  String? amount, bankCharge, postBalance, transactionId, details, createdAt;
  TransactionDetailView(
      {super.key,
      this.amount,
      this.bankCharge,
      this.postBalance,
      this.transactionId,
      this.details,
      this.createdAt});

  @override
  State<TransactionDetailView> createState() => _TransactionDetailViewState();
}

class _TransactionDetailViewState extends State<TransactionDetailView> {
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
        CustomHeader(
          title: "Transaction Detail",
        ),
        Container(
          margin: const EdgeInsets.only(top: 130, bottom: 10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                fillInformation(context),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget fillInformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          transactionInformation(
              title: 'Amount',
              field: widget.amount ?? "Amount",
              context: context),
          transactionInformation(
              title: 'Bank Charge',
              field: widget.bankCharge ?? 'Bank Charge',
              context: context),
          transactionInformation(
              title: 'Post Balance',
              field: widget.postBalance ?? "Post Balance",
              context: context),
          transactionInformation(
              title: 'Transaction Id',
              field: widget.transactionId ?? "Transaction Id",
              context: context),
          transactionInformation(
              title: "Details",
              field: widget.details ?? "Details",
              context: context),
          transactionInformation(
              title: 'Created At',
              field: widget.createdAt ?? 'createdAt',
              context: context)
        ],
      ),
    );
  }
}



Widget transactionInformation(
    {required String title,
    required String field,
    required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: Column(children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$title : ",
            style: MyColorScheme.detailTitleTextStyle(),
          ),
          SizedBox(
              height: 20,
              width: MediaQuery.sizeOf(context).width * 0.65,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Expanded(
                        child: Text(field,
                            style: title != 'Status'
                                ? MyColorScheme.detailFieldTextStyle()
                                : MyColorScheme.detailStatusTextStyle()),)
                  ],
                ),
              )),
        ],
      ),
      Divider(
        color: Colors.white.withOpacity(0.7),
      )
    ]),
  );
}
