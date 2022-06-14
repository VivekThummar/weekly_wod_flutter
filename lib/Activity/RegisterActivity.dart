import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/CommonViews/CommonLogoToolBar.dart';
import 'package:weekly_wod_flutter/CommonViews/ThemeRectangle.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';
import 'package:weekly_wod_flutter/Constant/FontConstant.dart';

class RegisterActivity extends StatefulWidget {
  const RegisterActivity({Key? key}) : super(key: key);

  @override
  RegisterBodyState createState() {
    return RegisterBodyState();
  }
}

class RegisterBodyState extends State<RegisterActivity> {
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
                    Text('Register', style: FontConstant.semiBold14Theme()),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 25,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          'User Registration',
                          style: FontConstant.semiBold12TextDark(),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline),
                                  labelText: 'Username'),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  // userName = value;
                                });
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3 ||
                                    !value.contains('.com')) {
                                  return 'Invalid email!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      // _toggle();
                                    },
                                    icon: const Icon(
                                        Icons.remove_red_eye_outlined),
                                  ),
                                  labelText: 'Password'),
                              keyboardType: TextInputType.visiblePassword,
                              // obscureText: _obscureText,
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
                                  // password = value;
                                });
                              },
                            ),
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
                            // dividerAfterLogin(),
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 32.0),
                              child: InkWell(
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
                            ),
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
  }
}
