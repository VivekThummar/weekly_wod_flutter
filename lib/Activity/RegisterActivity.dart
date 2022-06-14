import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/CommonViews/CommonLogoToolBar.dart';
import 'package:weekly_wod_flutter/CommonViews/ThemeRectangle.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';

class RegisterActivity extends StatefulWidget {
  const RegisterActivity({Key? key}) : super(key: key);

  @override
  RegisterBodyState createState() {
    return RegisterBodyState();
  }
}

class RegisterBodyState extends State<RegisterActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      body: Stack(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: SizedBox(height: 100, child: CommonLogoToolBar()),
          ),
          Padding(
              padding: EdgeInsets.only(top: 150.0), child: ThemeRectangle()),
        ],
      ),
    );
  }
}