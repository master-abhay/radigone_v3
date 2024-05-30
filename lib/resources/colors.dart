import 'package:flutter/material.dart';

class MyColorScheme {
  static const Color lightGrey0 = Color(0xff9C9DA1);
  static const Color lightGrey1 = Color(0xff4f545a);
  static const Color lightGrey2 = Color(0xff3c4147);
  static const Color lightGrey3 = Color(0xff1e2329);

  static const Color authContainerColor = Color(0xff3C4147);

  static const LinearGradient yellowLinearGradient = LinearGradient(colors: [
    Color(0xffFDD900),
    Color(0xffFD9800),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient buttonGradient = LinearGradient(colors: [
    Color(0xff077B1D),
    Color(0xff00A820),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient defaultButtonGradient = LinearGradient(colors: [
    Color(0xff2e3237),
    Color(0xff2e3237),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient bottomNavigationBar = LinearGradient(colors: [
    Color(0xff3C4147),
    Color(0xff252A2F),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);


}