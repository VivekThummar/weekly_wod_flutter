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
    // final isValid = _formKey.currentState?.validate();
    // if (!isValid!) {
    //   return;
    // }
    if (email.compareTo(confirmEmail) != 0) {
      printDebuggg('Emails are not Matching');
    } else if (email.compareTo(confirmEmail) == 0) {
      printDebuggg('Emails are Matching');
    }
    return;
    _formKey.currentState?.save();
  }

  String name = "", userName = "", password = "", confirmPassword = "", email = "", confirmEmail = "";
  String street = "", city = "", zipCode = "", paypalEmail = "", taxID = "";

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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 25,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'User Registration',
                                style: FontConstant.semiBold12TextDark(),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline),
                                  hintText: 'Name'),
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  return 'Invalid Name!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
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
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline),
                                  hintText: 'Password'),
                              keyboardType: TextInputType.visiblePassword,
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
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline),
                                  hintText: 'Confirm Password'),
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 7) {
                                  return 'Invalid password!';
                                } else if (password.compareTo(confirmPassword) != 0) {
                                  return 'Passwords are not Matching';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                setState(() {
                                  confirmPassword = value;
                                });
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  hintText: 'Email Address'),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Invalid Email!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  hintText: 'Confirm Email Address'),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  confirmEmail = value;
                                });
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Invalid Email!';
                                }

                                // else if (email != confirmEmail) {
                                //   return 'Emails are not Matching';
                                // } else if (email == confirmEmail) {
                                //   return 'Emails are Matching';
                                // }

                                return null;
                              },
                            ),
                            const SizedBox(height: 28),
                            SizedBox(
                              height: 25,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Fields',
                                style: FontConstant.semiBold12TextDark(),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.home),
                                  hintText: 'Street'),
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  street = value;
                                });
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty) {
                                  return 'Enter Street Address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.location_city),
                                  hintText: 'City'),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty) {
                                  return 'Enter City name';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                setState(() {
                                  city = value;
                                });
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.qr_code_sharp),
                                  hintText: 'Zip Code'),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty) {
                                  return 'Enter Zip Code';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                setState(() {
                                  zipCode = value;
                                });
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.paypal),
                                  hintText: 'Paypal Email'),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  paypalEmail = value;
                                });
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Invalid Paypal Email!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.add_card_outlined),
                                  hintText: 'social security number / US tax Id'),
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  taxID = value;
                                });
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty) {
                                  return 'Enter Valid Tax ID';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 32),
                            ElevatedButton(
                                child: Text('Register',
                                    style: FontConstant.semiBoldThemeButton()),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                    shape: const StadiumBorder()),
                                onPressed: () {
                                  setState(() {
                                    _submit();
                                  });
                                }),
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
  }

  void printDebuggg(String s) {}
}
