import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes/Global/Core/Constant/Colors.dart';

class AppToasts {
  static Future<bool?> errorToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red.withOpacity(0.6),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<bool?> successToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: GlobalColors.green.withOpacity(0.6),
        textColor: GlobalColors.white,
        fontSize: 16.0);
  }
}
