import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';

class FontConstant {
  // static TextStyle createStyle(
  //     Color txtColor, String family, double size, FontWeight weight) {
  //   return TextStyle(
  //       color: txtColor,
  //       fontFamily: family,
  //       fontSize: size,
  //       fontWeight: weight);
  // }

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

  static TextStyle regular11TextDark() {
    return const TextStyle(
        color: ColorConstants.textDarkColor, fontFamily: 'rubik', fontSize: 11);
  }

  static TextStyle semiBoldThemeButton() {
    return const TextStyle(
        color: Colors.white,
        fontFamily: 'rubik',
        fontSize: 12,
        fontWeight: FontWeight.w600);
  }

  static TextStyle semiBold12TextDark() {
    return const TextStyle(
        color: ColorConstants.textDarkColor,
        fontFamily: 'rubik',
        fontSize: 12,
        fontWeight: FontWeight.w600);
  }

  static TextStyle regular12TextDark() {
    return const TextStyle(
      color: ColorConstants.textDarkColor,
      fontFamily: 'rubik',
      fontSize: 12,
    );
  }

  static TextStyle regular12InputText() {
    return const TextStyle(
      color: ColorConstants.inputTextColor,
      fontFamily: 'rubik',
      fontSize: 12,
    );
  }

  static TextStyle regular12Green() {
    return const TextStyle(
      color: ColorConstants.colorGreen,
      fontFamily: 'rubik',
      fontSize: 12,
    );
  }

  static TextStyle regular12Yellow() {
    return const TextStyle(
      color: ColorConstants.colorYellow,
      fontFamily: 'rubik',
      fontSize: 12,
    );
  }

  static TextStyle regular13TextDark() {
    return const TextStyle(
      color: ColorConstants.textDarkColor,
      fontFamily: 'rubik',
      fontSize: 13,
    );
  }
}
