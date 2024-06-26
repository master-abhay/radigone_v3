import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class CustomDepositLogTile extends StatefulWidget {
   String? transactionId, date, day, amount, status;
   void Function() onTap;
   CustomDepositLogTile(
      {super.key,
      required this.transactionId,
      required this.date,
      required this.day,
      required this.amount,
      required this.status,
      required this.onTap});

  @override
  State<CustomDepositLogTile> createState() => _CustomDepositLogTileState();
}

class _CustomDepositLogTileState extends State<CustomDepositLogTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
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
                      borderRadius: BorderRadius.circular(15)),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.transactionId ??"Transaction Id",
                        style: MyColorScheme.titleTextStyle(),
                      ),
                      Text("RazorPay", style: MyColorScheme.subTitleTextStyle()),
                      Text(widget.date??"day month year",
                          style: MyColorScheme.subTitleTextStyle()),
                      Text(widget.day??"day", style: MyColorScheme.subTitleTextStyle())
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 85,
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
                        widget.amount??"Amount",
                        style: MyColorScheme.titleTextStyle(),
                      ),
                    ],
                  ),
                   Text(
                    widget.status ?? "status",
                    style:const  TextStyle(
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
                          border: Border.all(color: Colors.white.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "View Details",
                          style: TextStyle(color: Colors.amberAccent,fontSize: 12),
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
