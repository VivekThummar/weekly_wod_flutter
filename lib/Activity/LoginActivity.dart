import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Activity/RegisterActivity.dart';
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
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // String apiError = "Username is not Correct";
  // bool wrongUserName = false;
  // bool wrongPassword = false;

  String userName = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Text('Login', style: FontConstant.semiBold14Theme()),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline),
                                  hintText: 'Username'),
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  userName = value;
                                });
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Invalid Username!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _toggle();
                                    },
                                    icon: const Icon(
                                        Icons.remove_red_eye_outlined),
                                  ),
                                  hintText: 'Password'),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: _obscureText,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 7) {
                                  return 'Invalid password!';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                            forgotPass(),
                            ElevatedButton(
                                child: Text('Log In',
                                    style: FontConstant.semiBoldThemeButton()),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                    shape: const StadiumBorder()),
                                onPressed: () {
                                  setState(() {
                                    _submit();
                                  });
                                }),
                            dividerAfterLogin(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/ic_google.png'),
                                    radius: 25.0),
                                SizedBox(width: 20),
                                CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/ic_facebook.png'),
                                    radius: 25.0)
                              ],
                            ),
                            // createAcText(),
                            const SizedBox(height: 32),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const RegisterActivity()));
                              },
                              child: Text('Create an Account', style: FontConstant.regular11TextDark()),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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

Widget forgotPass() {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
    child: Container(
        alignment: Alignment.centerRight,
        child: Text('Forgot Your Password?',
            style: FontConstant.regular11TextDark())),
  );
}

Widget dividerAfterLogin() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 32.0),
    child: Center(
      child: Row(
        children: [
          const Expanded(
            child: Divider(thickness: 1, endIndent: 16),
            flex: 1,
          ),
          Text('OR', style: FontConstant.regular11TextDark()),
          const Expanded(
            child: Divider(thickness: 1, indent: 16),
            flex: 1,
          ),
        ],
      ),
    ),
  );
}
