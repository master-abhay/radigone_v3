import 'package:flutter/material.dart';

import '../colors.dart';

Widget CustomBasicInformationField(
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
          SizedBox(
            child: Text(
              "$title : ",
              style: MyColorScheme.detailTitleTextStyle().apply(),
              textAlign: TextAlign.start,
              softWrap: false,
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: SizedBox(
                height: 20, // width: MediaQuery.sizeOf(context).width * 0.65,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(field,
                            style: title != 'Status'
                                ? MyColorScheme.detailFieldTextStyle()
                                : MyColorScheme.detailStatusTextStyle()),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
      Divider(
        color: Colors.white.withOpacity(0.7),
      )
    ]),
  );
}
