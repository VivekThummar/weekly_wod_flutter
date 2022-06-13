import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';

class FontConstant {

  //  SemiBold12White
  static TextStyle createStyle(
      Color txtColor, String family, double size, FontWeight weight) {
    return TextStyle(
        color: txtColor,
        fontFamily: family,
        fontSize: size,
        fontWeight: weight);
  }

  static TextStyle semiBold12White() {
    return const TextStyle(
        color: Colors.white,
        fontFamily: 'rubik',
        fontSize: 12,
        fontWeight: FontWeight.w600);
  }

  static TextStyle semiBold14Theme() {
    return const TextStyle(
        color: ColorConstants.themeColor,
        fontFamily: 'rubik',
        fontSize: 14,
        fontWeight: FontWeight.w600);
  }

}
