import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class CustomTransactionTile extends StatefulWidget {
  String? transactionId, date, day, amount, status,username,transactionType;
  void Function() onTap;
  CustomTransactionTile(
      {super.key,
      required this.transactionId,
        required this.username,
        required this.transactionType,
      required this.date,
      required this.day,
      required this.amount,
      required this.status,
      required this.onTap});

  @override
  State<CustomTransactionTile> createState() => _CustomTransactionTileState();
}

class _CustomTransactionTileState extends State<CustomTransactionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8),
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
                  height: MediaQuery.of(context).size.width * 0.19,
                  width: MediaQuery.of(context).size.width * 0.19,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: SvgPicture.asset(
                    "images/paytm.svg",
                    height: 85,
                    width: 70,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.23,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.transactionId ?? "Transaction Id",
                        style: MyColorScheme.titleTextStyle(),
                      ),
                      Container(
                        // color: Colors.purple,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.username!.length < 8
                                      ? widget.username!
                                      : '${widget.username!.substring(0, 6)}..' ?? "Amount",
                                  style: MyColorScheme.subTitleTextStyle(),
                                ),
                                Text("RazorPay",
                                    style: MyColorScheme.subTitleTextStyle()),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.015,
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.015,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.date ?? "day month year",
                                    style: MyColorScheme.subTitleTextStyle()),
                                Text(widget.day ?? "day",
                                    style: MyColorScheme.subTitleTextStyle())
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.23,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: SvgPicture.asset("images/coin.svg"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.amount!.length < 7
                            ? widget.transactionType! + widget.amount!
                            : '${widget.transactionType!  + widget.amount!.substring(0, 6)}..' ?? "Amount",
                        style: widget.transactionType == '+' ?  MyColorScheme.transactionAdd() : MyColorScheme.transactionMinus()
    ,
                      ),
                    ],
                  ),
                  Text(
                    widget.status ?? "status",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                  SizedBox(
                    child: GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "View Details",
                          style: TextStyle(
                              color: Colors.amberAccent, fontSize: 10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
