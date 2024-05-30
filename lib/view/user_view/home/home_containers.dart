import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/colors.dart';





class HomeContainers extends StatefulWidget {

  final Widget icon;
  final String text;
  final String containerValue;
  final double borderRadius;
  // final List<Color> gradientColors;
  // final bool isSvg;
  SvgPicture? svgPicture;


   HomeContainers({super.key,
    // required this.isSvg,
   required this.icon,
     required this.text,
    required this.containerValue,
    // required this.gradientColors,
    required this.borderRadius,
    this.svgPicture

  });

  @override
  State<HomeContainers> createState() => _HomeContainersState();
}

class _HomeContainersState extends State<HomeContainers> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(19),
      child: Container(
        height: MediaQuery.of(context).size.height*0.2,
        width: MediaQuery.of(context).size.height*0.18,
        decoration: BoxDecoration(
          color: MyColorScheme.lightGrey3,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                      borderRadius: BorderRadius.circular(widget.borderRadius)),
                  child: Container(
                      // height: 22,
                      // width: 22,
                      alignment: Alignment.center,
                      child: widget.icon)

              ),
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
                child: Text(
                  widget.containerValue,
                  style: const TextStyle(
                      fontSize: 12.31, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
