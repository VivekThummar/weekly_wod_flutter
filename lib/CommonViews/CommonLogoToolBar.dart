import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Constant/FontConstant.dart';
import 'package:weekly_wod_flutter/Constant/StringConstants.dart';

class CommonLogoToolBar extends StatefulWidget {
  const CommonLogoToolBar({Key? key}) : super(key: key);

  @override
  ToolBarState createState() {
    return ToolBarState();
  }
}

class ToolBarState extends State<CommonLogoToolBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            width: 80,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              StringConstants.appTitle,
              style: FontConstant.semiBold12White(),
            ),
          )
        ],
      ),
    );
  }
}
