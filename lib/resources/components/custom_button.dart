import 'package:flutter/material.dart';

import '../colors.dart';


class CustomButton extends StatefulWidget {
  final String buttonName;
  final bool isLoading;
  final bool isGradient;
   double? height;
   double? fontSize;
  final void Function() onTap;

   CustomButton(
      {super.key,
      required this.buttonName,
      required this.isLoading,
      required this.isGradient,
        this.height,
        this.fontSize,
      required this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height:  widget.height ?? MediaQuery.of(context).size.height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: widget.isGradient
                  ? MyColorScheme.buttonGradient
                  : MyColorScheme.defaultButtonGradient,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: widget.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.0,
                    )
                  : Text(
                      widget.buttonName,
                      style:  TextStyle(
                          color: Colors.white,
                          fontSize: widget.fontSize ?? 22,
                          fontWeight: FontWeight.bold),
                    )),
        ),
      ),
    );
  }
}
