import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class CustomListTile extends StatefulWidget {
  String? title, remark, value, time;
  Widget? leading;

  CustomListTile({
    super.key,
    this.leading,
    this.title,
    this.remark,
    this.value,
    this.time,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.leading ??
                          Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(180)),
                            child: SvgPicture.asset(
                              "images/coin.svg",
                              height: 32,
                              width: 32,
                            ),
                          ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title ?? "Title",
                            style: MyColorScheme.titleTextStyle(),
                          ),
                          Text(
                            widget.remark ?? "Remark",
                            style: MyColorScheme.subTitleTextStyle(),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.value ?? "Value",
                        style: MyColorScheme.statusTextStyle(),
                      ),
                      Text(
                        widget.time ?? "Date and Time",
                        style: MyColorScheme.subTitleTextStyle(),
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
