import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:weekly_wod_flutter/Activity/HomeActivity.dart';
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

  bool _switchValue = false;
  bool isTermsAccepted = false;
  bool isRuleBookAccepted = false;
  bool isLiabilityAccepted = false;

  TextEditingController dobController = TextEditingController();
  String dob = '';
  String state = '';

  static List<String> menuItems = <String>[
    'State 1',
    'State 2',
    'State 3',
    'State 4',
  ];

  List<DropdownMenuItem<String>> stateList = menuItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  late SnackBar snackBar;

  bool _submit() {
    final isValid = _formKey.currentState?.validate();
    if (_switchValue) {
      _formKey.currentState?.save();
      return true;
    } else if (!isValid!) {
      return false;
    } else if (!isTermsAccepted ||
        !isRuleBookAccepted ||
        !isLiabilityAccepted) {
      return false;
    } else if (state.isEmpty) {
      return false;
    } else {
      _formKey.currentState?.save();
      return true;
    }
  }

  String name = "",
      userName = "",
      password = "",
      confirmPassword = "",
      email = "",
      confirmEmail = "";
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
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Text('Register', style: FontConstant.semiBold14Theme()),
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
                              onChanged: (text) {
                                name = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Invalid Name!';
                                } else if (value.length < 3) {
                                  return 'Name should be at least 3 characters long';
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
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline),
                                  hintText: 'Password'),
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (text) {
                                password = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Invalid password!';
                                } else if (value.length < 7) {
                                  return 'Password should be at least 7 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline),
                                  hintText: 'Confirm Password'),
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (text) {
                                confirmPassword = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Invalid password!';
                                } else if (value.length < 7) {
                                  return 'Password should be at least 7 characters long';
                                } else if (password
                                        .compareTo(confirmPassword) !=
                                    0) {
                                  return 'Passwords are not Matching';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  hintText: 'Email Address'),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (text) {
                                email = text;
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
                              onChanged: (text) {
                                confirmEmail = text;
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                  return 'Invalid Email!';
                                } else if (email.compareTo(confirmEmail) != 0) {
                                  return 'Emails are not Matching';
                                }

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
                              readOnly: true,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_month),
                                  hintText: 'Date of birth'),
                              keyboardType: TextInputType.text,
                              onTap: _selectDate,
                              controller: dobController,
                              // onChanged: (text) {
                              //   dob = text;
                              // },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Select Date of Birth';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.horizontal_distribute),
                                  hintText: 'Street'),
                              keyboardType: TextInputType.text,
                              onChanged: (text) {
                                street = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
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
                              onChanged: (text) {
                                city = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter City name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.qr_code_sharp),
                                  hintText: 'Zip Code'),
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                name = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Zip Code';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.sixty_fps_select_outlined),
                                  ),
                                  isExpanded: true,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  hint: const Text('Select State'),
                                  items: stateList,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      setState(
                                        () => {
                                          state = newValue,
                                        },
                                      );
                                    }
                                  }),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.paypal),
                                  hintText: 'Paypal Email'),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (text) {
                                paypalEmail = text;
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
                                  hintText:
                                      'social security number / US tax Id'),
                              keyboardType: TextInputType.text,
                              onChanged: (text) {
                                taxID = text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Valid Tax ID';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: isTermsAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      isTermsAccepted = value!;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10), //SizedBox
                                Text(
                                  'Agree with Terms & Conditions',
                                  style: TextStyle(
                                    fontFamily: 'rubik',
                                    color: checkboxColor(isTermsAccepted),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: isRuleBookAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      isRuleBookAccepted = value!;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10), //SizedBox
                                Text(
                                  'Agree with Rule Book',
                                  style: TextStyle(
                                      fontFamily: 'rubik',
                                      color: checkboxColor(isRuleBookAccepted)),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: isLiabilityAccepted,
                                  onChanged: (value) {
                                    setState(() {
                                      isLiabilityAccepted = value!;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10), //SizedBox
                                Text(
                                  'Agreeing to waiver of liability',
                                  style: TextStyle(
                                      fontFamily: 'rubik',
                                      color:
                                          checkboxColor(isLiabilityAccepted)),
                                ),
                              ],
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
                                    bool isValid = _submit();
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    if (!isValid) {
                                      if (!isTermsAccepted) {
                                        displaySnackBar(
                                            'Please agree with Terms and Conditions');
                                      } else if (!isRuleBookAccepted) {
                                        displaySnackBar(
                                            'Please agree with Rule Book');
                                      } else if (!isLiabilityAccepted) {
                                        displaySnackBar(
                                            'Please agree with waiver of liability');
                                      } else if (state.isEmpty) {
                                        displaySnackBar('Please Select State');
                                      }
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeActivity()));
                                    }
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

  void displaySnackBar(String message) {
    snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  DateTime selectedDate = DateTime.now();

  _selectDate() async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(selectedDate.year + 1),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        // dobHint =
        //     '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}';
        dobController.text = DateFormat('yyyy/MM/dd').format(selectedDate);
      });
    }
  }
}

Color checkboxColor(bool checked) {
  if (checked) {
    return ColorConstants.themeColor;
  } else {
    return ColorConstants.textDarkColor;
  }
}
