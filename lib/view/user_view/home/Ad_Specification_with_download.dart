import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdSpecification extends StatefulWidget {
  final specificationName;
  final void Function() onTap;
  const AdSpecification({super.key, required this.specificationName,required this.onTap});

  @override
  State<AdSpecification> createState() => _AdSpecificationState();
}

class _AdSpecificationState extends State<AdSpecification> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.specificationName,
            style: TextStyle(
                color: Colors.white,
                fontSize:
                MediaQuery.sizeOf(context).height * 0.021,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: widget.onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Download",
                  style: TextStyle(color: Color(0xffFDD900)),
                ),
                const  SizedBox(width: 3,),
                SizedBox(
                    height: 70,
                    width: 15,
                    child: SvgPicture.asset(
                        "images/download_Ad.svg"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
