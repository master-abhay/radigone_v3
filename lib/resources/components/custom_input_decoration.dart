import 'package:flutter/material.dart';

class CustomInputDecoration {
  static InputDecoration getDecoration({
    required BuildContext context,
    required String hintText,
    Widget? icon,
    bool filled = true,
    Color fillColor = Colors.black12,
    bool alignLabelWithHint = true,
  }) {


    final screenWidth = MediaQuery.of(context).size.width;
    final contentPaddingHorizontal = screenWidth * 0.02;
    final contentPaddingVertical = screenWidth * 0.01;
    final fontSize = screenWidth * 0.04;
    final labelFontSize = screenWidth * 0.035;
    return InputDecoration(
      errorStyle: TextStyle(color: Colors.white.withOpacity(1)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
        vertical: MediaQuery.of(context).size.width * 0.01,
      ),
      suffix: icon,
      alignLabelWithHint: alignLabelWithHint,
      hintText: hintText.toLowerCase(),
      hintFadeDuration: const Duration(milliseconds: 500),
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.red.withOpacity(0.8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white),
      ),
      label: Text(
        hintText,
        style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: labelFontSize),
      ),
      filled: filled,
      fillColor: fillColor,


    );
  }
}
