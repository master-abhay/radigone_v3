import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';



class TransactionTile extends StatefulWidget {

  String? title, remark, amount,time;

   TransactionTile({super.key,

     this.title,
     this.remark,
     this.amount,
     this.time

   });

  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  @override
  Widget build(BuildContext context) {
       return SizedBox(
      child: Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 1),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.7),
                            borderRadius:
                            BorderRadius.circular(180)),
                        child: SvgPicture.asset(
                          "images/coin.svg",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title ?? "Transaction Id",
                            style: MyColorScheme.titleTextStyle(),
                          ),
                          Text(
                            widget.remark ?? "Payment Remark",
                            style:
                            MyColorScheme.subTitleTextStyle(),
                          )
                        ],
                      ),
                    ],
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.amount ?? "Amount",
                        style: MyColorScheme.statusTextStyle(),
                      ),
                      Text(
                        widget.time ?? "Date and Time",
                        style:
                        MyColorScheme.subTitleTextStyle(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
