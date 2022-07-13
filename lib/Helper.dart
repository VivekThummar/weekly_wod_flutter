import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';

class Helper {
  static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorConstants.colorToastBg,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }
}
