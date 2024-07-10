
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Utils{


  static get defaultPinTheme => PinTheme(
      width: 44,
      height: 44,
      textStyle: const TextStyle(fontSize: 18, color: Colors.white),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.transparent)));


}