import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:radigone_v3/resources/components/background_designs.dart';
import 'package:radigone_v3/resources/components/custom_header.dart';
import 'package:radigone_v3/resources/components/custom_list_tile.dart';
import 'package:radigone_v3/view/user_view/side_menu_bar_views/transaction_detail_view.dart';
import 'package:radigone_v3/view_model/services/navigation_services.dart';
import 'package:radigone_v3/view_model/user_view_model/side_menu_bar_view_models/transaction_viewModel.dart';

import '../../../data/response/status.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  late NavigationServices _navigationServices;
  @override
  void initState() {
    super.initState();
    final GetIt _getIt = GetIt.instance;
    _navigationServices = _getIt.get<NavigationServices>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider =
          Provider.of<TransactionViewModel>(context, listen: false);
      provider.fetchTransactions(context);
    });
  }

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
          title: "Transaction",
        ),
        Container(
          margin: const EdgeInsets.only(top: 120, bottom: 10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Consumer<TransactionViewModel>(
                    builder: (context, providerValue, _) {
                  switch (providerValue.transactionsHistory.status) {
                    case Status.LOADING:
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.5,
                        ),
                      );

                    case Status.ERROR:
                      return const Center(
                        child: Text("Something went Wrong"),
                      );

                    case Status.COMPLETED:
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: providerValue
                              .transactionsHistory.data?.data?.length,
                          itemBuilder: (context, index) {
                            var item = providerValue
                                .transactionsHistory.data?.data?[index];
                            var transactionId = item?.trx ?? "Transaction Id";
                            var detail = item!.details!.length < 15
                                ? int.parse(item.details!).toString()
                                : '${item.details!.substring(0, 15)}..';
                            var amount = '${item.trxType}${item.amount!}';
                            var createdAt = item.createdAt!.length < 10
                                ? item.createdAt
                                : item.createdAt!.substring(0, 10);
                            var bankCharge = item.charge;
                            var postBalance = item.postBalance;

                            return GestureDetector(
                              onTap: () {
                                _navigationServices.push(MaterialPageRoute(
                                    builder: (context) => TransactionDetailView(
                                          amount: amount,
                                          bankCharge: bankCharge,
                                          postBalance: postBalance,
                                          transactionId: transactionId,
                                          details: item.details,
                                          createdAt: item.createdAt,
                                        )));
                              },
                              child: CustomListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.7),
                                        borderRadius:
                                            BorderRadius.circular(180)),
                                    child: SvgPicture.asset(
                                      "images/coin.svg",
                                      height: 32,
                                      width: 32,
                                    ),
                                  ),
                                  title: transactionId,
                                  remark: detail,
                                  value: amount,
                                  time: createdAt),
                            );
                          });
                    case null:
                      return const Center(
                        child: Text("Something went Wrong"),
                      );
                  }
                })
              ],
            ),
          ),
        )
      ],
    );
  }
}
