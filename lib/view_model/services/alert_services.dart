import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import 'navigation_services.dart';

class AlertServices {
  final GetIt _getIt = GetIt.instance;
  late NavigationServices _navigationServices;

  AlertServices() {
    _navigationServices = _getIt.get<NavigationServices>();
  }

  /// Shows a toast message using DelightToast.
  void showToast({required String message}) {
    try {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) {
          return ToastCard(
            leading: const Icon(
              Icons.notifications_active_outlined,
              size: 28,
              color: Colors.amber,
            ),
            title: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
            color: Colors.white,
          );
        },
      ).show(_navigationServices.navigationStateKey.currentState!.context);
    } catch (error) {
      debugPrint("Error showing toast: $error");
    }
  }

  /// Shows a simple toast message using Fluttertoast.
  void showSimpleToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15,
    );
  }

  /// Displays a flushBar with an error message.
  void flushBarErrorMessages(String message, BuildContext context) {
    Flushbar(
      message: message,
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInQuad,
      duration: const Duration(seconds: 5),
      borderRadius: BorderRadius.circular(15),
      icon: const Icon(
        Icons.notifications_active_outlined,
        size: 28,
        color: Colors.white,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      backgroundColor: Colors.black,
      flushbarStyle: FlushbarStyle.FLOATING,
    ).show(context);
  }

  /// Displays a SnackBar with a success message.
  void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
