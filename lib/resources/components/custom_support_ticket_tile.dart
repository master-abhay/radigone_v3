import 'package:flutter/material.dart';
import 'package:radigone_v3/resources/components/constants.dart';

import '../colors.dart';

class CustomSupportTicketTile extends StatefulWidget {
  String? subject, emailAddress, lastReply, imageUrl, status;
  void Function() edit;
  void Function() delete;

  CustomSupportTicketTile(
      {super.key,
      required this.subject,
      required this.emailAddress,
      required this.status,
      required this.lastReply,
      required this.imageUrl,
      required this.edit,
      required this.delete});

  @override
  State<CustomSupportTicketTile> createState() =>
      _CustomSupportTicketTileState();
}

class _CustomSupportTicketTileState extends State<CustomSupportTicketTile> {
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
                  height: MediaQuery.of(context).size.width * 0.23,
                  width: MediaQuery.of(context).size.width * 0.23,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.imageUrl ?? PLACEHOLDER_PFP, // height: 80,
                      // width: 80,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, object, stackTrace) {
                        return Container(
                          padding: EdgeInsets.zero,
                          height: MediaQuery.of(context).size.width * 0.2,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: const Icon(
                            Icons.error_outline_outlined,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.23,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.subject ?? "Subject",
                        style: MyColorScheme.titleTextStyle(),
                      ),
                      Text(widget.emailAddress ?? "Email Address",
                          style: MyColorScheme.subTitleTextStyle()),
                      Text(widget.lastReply ?? "Last Reply",
                          style: MyColorScheme.subTitleTextStyle()),
                      Text(widget.status ?? "Status",
                          style: const TextStyle(color: Colors.amberAccent,fontSize: 16,fontWeight: FontWeight.w600))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.23,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: widget.edit,
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.22,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.white.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                            color: Colors.amberAccent, fontSize: 14),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: widget.delete,
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width * 0.08,
                      width: MediaQuery.of(context).size.width * 0.22,

                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.white.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.orange, fontSize: 14),
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
