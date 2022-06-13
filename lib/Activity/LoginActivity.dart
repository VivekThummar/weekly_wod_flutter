import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/CommonViews/ThemeRectangle.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';
import 'package:weekly_wod_flutter/CommonViews/CommonLogoToolBar.dart';
import 'package:weekly_wod_flutter/Constant/FontConstant.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);

  @override
  LoginBodyState createState() {
    return LoginBodyState();
  }
}

class LoginBodyState extends State<LoginActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      body: Stack(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: SizedBox(height: 100, child: CommonLogoToolBar()),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 150.0), child: ThemeRectangle()),
          Padding(
            padding: const EdgeInsets.only(top: 175.0),
            child: Center(
              child: Column(
                children: [
                  Text('Login', style: FontConstant.semiBold14Theme()),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Username'),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            setState(() {
                              // email = value;
                            });
                          },
                          validator: (value) {
                            // if (value.isEmpty || !value.contains('@')) {
                            //   return 'Invalid email!';
                            // }
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Password'),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) {
                            // if (value.isEmpty && value.length < 7) {
                            //   return 'Invalid password!';
                            // }
                          },
                          onFieldSubmitted: (value) {
                            setState(() {
                              // password = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Container(
    //         color: ColorConstants.themeColor,
    //       ),
    //       Column(
    //         children: <Widget>[
    //           const Padding(
    //             padding: EdgeInsets.only(top: 32),
    //             child: CommonLogoToolBar(),
    //           ),
    //           Stack(
    //             children: const <Widget>[
    //               ThemeRectangle(),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
