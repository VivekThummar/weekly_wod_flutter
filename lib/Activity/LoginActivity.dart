import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weekly_wod_flutter/Activity/HomeActivity.dart';
import 'package:weekly_wod_flutter/Activity/RegisterActivity.dart';
import 'package:weekly_wod_flutter/CommonViews/CommonLogoToolBar.dart';
import 'package:weekly_wod_flutter/CommonViews/ThemeRectangle.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';
import 'package:weekly_wod_flutter/Constant/FontConstant.dart';
import 'package:weekly_wod_flutter/ToastView.dart';
import 'package:weekly_wod_flutter/apis/ApiClient.dart';
import 'package:weekly_wod_flutter/generated/assets.dart';
import 'package:weekly_wod_flutter/models/LoginResponse.dart';

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
  bool _switchValue = false;
  late FToast fToast = FToast();

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate();
    if (_switchValue) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeActivity()));
      return;
    }
    if (!isValid!) {
      return;
    }

    Map map = {
      'username': userName,
      'password': password,
      'device_tokon': '54545545454',
      'device_type': 'A'
    };

    LoginResponse model = await HttpServices().userLogin(map);
    if (model.success != null && model.success!) {
      debugPrint('Login Successful');
      _formKey.currentState?.reset();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeActivity()));
    } else {
      if (model.status == 406) {
        debugPrint('Already Login in other Device');
      } else {
        if(model.message != null && model.message!.error != null) {
          Widget test = ToastView(model.message!.error!);
          fToast.showToast(
            child: test,
            gravity: ToastGravity.TOP,
            toastDuration: const Duration(seconds: 2),
          );
        }
        debugPrint('Login Failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      backgroundColor: ColorConstants.themeColor,
      body: SafeArea(
        child: Stack(
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
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Text('Login', style: FontConstant.semiBold14Theme()),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('By-Pass: ',
                              style: FontConstant.semiBold14Theme()),
                          FlutterSwitch(
                            width: 47.0,
                            height: 29.0,
                            value: _switchValue,
                            onToggle: (bool value) {
                              setState(() {
                                _switchValue = value;
                              });
                            },
                            borderRadius: 30.0,
                            padding: 0.0,
                            toggleColor: ColorConstants.themeColor,
                            activeColor: Colors.white,
                            inactiveColor: Colors.white,
                            activeSwitchBorder: Border.all(
                              color: ColorConstants.inputTextColor,
                              width: 2.0,
                            ),
                            inactiveSwitchBorder: Border.all(
                              color: ColorConstants.themeColor,
                              width: 2.0,
                            ),
                          ),
                        ],
                      ),
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
                                onChanged: (text) {
                                  userName = text;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Invalid Username!';
                                  } else if (value.length < 3) {
                                    return 'Username should be at least 3 characters long';
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
                                      icon: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: ColorConstants.themeColor,
                                      ),
                                    ),
                                    hintText: 'Password'),
                                keyboardType: TextInputType.text,
                                obscureText: _obscureText,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Invalid password!';
                                  } else if (value.length < 7) {
                                    return 'Password should be at least 7 characters long';
                                  }
                                  return null;
                                },
                                onChanged: (text) {
                                  password = text;
                                },
                              ),
                              forgotPass(),
                              ElevatedButton(
                                  child: Text('Log In',
                                      style:
                                          FontConstant.semiBoldThemeButton()),
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
                                          AssetImage(Assets.imagesIcGoogle),
                                      radius: 25.0),
                                  SizedBox(width: 20),
                                  CircleAvatar(
                                      backgroundImage:
                                          AssetImage(Assets.imagesIcFacebook),
                                      radius: 25.0)
                                ],
                                // children: [
                                //   InkWell(
                                //     child: InkWell(
                                //       onTap: () {},
                                //       child: ClipRRect(
                                //         borderRadius:
                                //         BorderRadius.circular(35.0),
                                //         child: Image.asset(
                                //             'images/ic_google.png',
                                //             width: 70.0,
                                //             height: 70.0),
                                //       ),
                                //     ),
                                //   ),
                                //   const SizedBox(width: 20),
                                //   InkWell(
                                //     child: InkWell(
                                //       onTap: () {},
                                //       child: ClipRRect(
                                //         borderRadius:
                                //         BorderRadius.circular(35.0),
                                //         child: Image.asset(
                                //             'images/facebook.png',
                                //             width: 70.0,
                                //             height: 70.0),
                                //       ),
                                //     ),
                                //   ),
                                // ],
                              ),
                              // createAcText(),
                              const SizedBox(height: 32),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterActivity()));
                                },
                                child: Text('Create an Account',
                                    style: FontConstant.regular11TextDark()),
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
      ),
    );
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
