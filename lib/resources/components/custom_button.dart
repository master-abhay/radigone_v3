import 'package:flutter/material.dart';

import '../colors.dart';

class CustomButton extends StatefulWidget {
  final String buttonName;
  final bool isLoading;
  final bool isGradient;
  final double? height;
  final double? fontSize;
  final void Function() onTap;

  const CustomButton({
    Key? key,
    required this.buttonName,
    required this.isLoading,
    required this.isGradient,
    this.height,
    this.fontSize,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoading ? null : widget.onTap, // Disable tap when loading
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: widget.height ?? MediaQuery.of(context).size.height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: widget.isGradient
                ? MyColorScheme.buttonGradient
                : MyColorScheme.defaultButtonGradient,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: widget.isLoading
                ? SizedBox(
              height: 25,
                  width: 25,
                  child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                )
                : Text(
              widget.buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: widget.fontSize ?? 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
