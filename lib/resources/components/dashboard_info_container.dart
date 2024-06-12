import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

class DashboardInformationContainer extends StatefulWidget {
  final Widget icon;
  final String text;
  final String containerValue;
  final double iconRadius;

  // final List<Color> gradientColors;
  // final bool isSvg;
  SvgPicture? svgPicture;

  DashboardInformationContainer(
      {super.key, // required this.isSvg,
      required this.icon,
      required this.text,
      required this.containerValue, // required this.gradientColors,
      required this.iconRadius,
      this.svgPicture});

  @override
  State<DashboardInformationContainer> createState() =>
      _DashboardInformationContainerState();
}

class _DashboardInformationContainerState
    extends State<DashboardInformationContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(19),
      child: Container(
        // height: MediaQuery.of(context).size.width * 0.5,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: MyColorScheme.lightGrey3,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 22,
                  width: 22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // gradient:  LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      //   colors: [
                      //    widget.gradientColors[0],
                      //     widget.gradientColors[1]
                      //   ],
                      // ),
                      borderRadius: BorderRadius.circular(widget.iconRadius)),
                  child: Container(
                      // height: 22,
                      // width: 22,
                      alignment: Alignment.center,
                      child: widget.icon)),
            const  SizedBox(height: 15,),
              Text(
                widget.text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.77,
                    fontWeight: FontWeight.w600),
              ),
              const  SizedBox(height: 15,),

              Container(
                height: 27,
                width: 73,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.38)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          widget.containerValue,
                          style: const TextStyle(
                              fontSize: 12.31, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardInformationContainer_1 extends StatefulWidget {
  final Widget icon;
  final String text;
  final String containerValue;
  final double iconRadius;

  // final List<Color> gradientColors;
  // final bool isSvg;
  SvgPicture? svgPicture;

  DashboardInformationContainer_1(
      {super.key, // required this.isSvg,
      required this.icon,
      required this.text,
      required this.containerValue, // required this.gradientColors,
      required this.iconRadius,
      this.svgPicture});

  @override
  State<DashboardInformationContainer_1> createState() =>
      _DashboardInformationContainer_1State();
}

class _DashboardInformationContainer_1State
    extends State<DashboardInformationContainer_1> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(19),
      child: Container(
        // height: MediaQuery
        //   .of(context)
        //   .size
        //   .height * 0.2,
        // width: MediaQuery
        //     .of(context)
        //     .size
        //     .height * 0.18,
        decoration: BoxDecoration(
          color: MyColorScheme.lightGrey3,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 22,
                  width: 22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // gradient:  LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      //   colors: [
                      //    widget.gradientColors[0],
                      //     widget.gradientColors[1]
                      //   ],
                      // ),
                      borderRadius: BorderRadius.circular(widget.iconRadius)),
                  child: Container(
                      // height: 22,
                      // width: 22,
                      alignment: Alignment.center,
                      child: widget.icon)),
              Text(
                widget.text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.77,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                height: 27,
                width: 73,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.38)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          widget.containerValue,
                          style: const TextStyle(
                              fontSize: 12.31, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
