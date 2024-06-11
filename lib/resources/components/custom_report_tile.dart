import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:radigone_v3/resources/components/constants.dart';

import '../colors.dart';

class CustomReportTile extends StatefulWidget {
  String? name, date, campaignCategory, imageUrl,totalQuestions;
  void Function() onTap;
  CustomReportTile(
      {super.key,
        required this.name,
        required this.date,
        required this.totalQuestions,
        required this.campaignCategory,
        required this.imageUrl,
        required this.onTap});

  @override
  State<CustomReportTile> createState() => _CustomReportTileState();
}

class _CustomReportTileState extends State<CustomReportTile> {
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
                  height: MediaQuery.of(context).size.width*0.23,
                  width: MediaQuery.of(context).size.width*0.23,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(

                      widget.imageUrl ?? PLACEHOLDER_PFP,
                      // height: 80,
                      // width: 80,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context,object,stackTrace){
                        return Container(
                          padding: EdgeInsets.zero,
                          height: MediaQuery.of(context).size.width*0.2,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: const BoxDecoration(
                            color: Colors.white
                          ),
                          child: const Icon(Icons.error_outline_outlined,color: Colors.red,),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.23,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name ??"Name",
                        style: MyColorScheme.titleTextStyle(),
                      ),
                      Text( widget.campaignCategory??"Campaign Category", style: MyColorScheme.subTitleTextStyle()),
                      Text(widget.totalQuestions??"Total Questions",
                          style: MyColorScheme.subTitleTextStyle()),
                      Text(widget.date??"13 July 2023", style: MyColorScheme.subTitleTextStyle())
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width*0.23,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                          "Download\n   Report",
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
