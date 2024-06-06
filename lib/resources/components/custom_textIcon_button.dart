import 'package:flutter/material.dart';

import '../colors.dart';

class CustomTextIconButton extends StatelessWidget {
  double elevation;
  Gradient gradient;
  String text;
  Color textColor;
  Icon icon;
  void Function() onTap;

  CustomTextIconButton(
      {super.key,
      required this.elevation,
      required this.gradient,
      required this.text,
        required this.textColor,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(150),
        child: Container(
          height: 32,
          decoration: BoxDecoration(
              gradient: gradient, borderRadius: BorderRadius.circular(150)),
          child: Padding(
            padding: EdgeInsets.only(right: 13, left: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style:  TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
               const SizedBox(width: 3,),
                icon
              ],
            ),
          ),
        ),
      ),
    );
  }
}
