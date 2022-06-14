import 'package:flutter/material.dart';

class DrawableConstants {

  static ButtonStyle createThemeButton() {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.red)
            )
        )
    );
  }

}