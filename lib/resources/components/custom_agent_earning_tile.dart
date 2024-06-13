import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class CustomAgentEarningTile extends StatefulWidget {
  String? name, email, amount, date, status;
  void Function() onTap;
  CustomAgentEarningTile(
      {super.key,
        required this.name,
        required this.email,
        required this.date,
        required this.amount,
        required this.status,
        required this.onTap});

  @override
  State<CustomAgentEarningTile> createState() => _CustomAgentEarningTileState();
}

class _CustomAgentEarningTileState extends State<CustomAgentEarningTile> {
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
                        widget.name ??"Name",
                        style: MyColorScheme.titleTextStyle(),
                      ),
                      SizedBox(
                        width: 100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Text( widget.email ?? "Email", style: MyColorScheme.subTitleTextStyle()),
                            ],
                          ),
                        ),
                      ),

                      Text(widget.date??"Date", style: MyColorScheme.subTitleTextStyle())
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 85,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
