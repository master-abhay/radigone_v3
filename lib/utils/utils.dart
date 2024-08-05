
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


mixin MediaQueryMixin<T extends StatefulWidget> on State<T> {
  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;

  Orientation get orientation => MediaQuery.of(context).orientation;

  EdgeInsets get padding => MediaQuery.of(context).padding;

  EdgeInsets get viewInsets => MediaQuery.of(context).viewInsets;

  double get horizontalPadding => MediaQuery.of(context).padding.horizontal;

  double get verticalPadding => MediaQuery.of(context).padding.vertical;
}


//creating the animated Route using page builder:
Route createRoute(dynamic page) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(0.0, 1), end: const Offset(0, 0))
            .chain(CurveTween(curve: Curves.ease));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}