import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Constant/FontConstant.dart';
import 'package:weekly_wod_flutter/generated/assets.dart';

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
            Assets.imagesLogo,
            width: 80,
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'WEEKLY WOD THROWDOWN',
              style: FontConstant.semiBold12White(),
            ),
          )
        ],
      ),
    );
  }
}
