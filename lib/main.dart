import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Activity/LoginActivity.dart';

void main() {
  runApp(const MaterialApp(
    home: Landing(),
  ));
}

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginActivity();
  }
}
