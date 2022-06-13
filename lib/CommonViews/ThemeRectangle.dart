import 'package:flutter/material.dart';

class ThemeRectangle extends StatefulWidget {
  const ThemeRectangle({Key? key}) : super(key: key);

  @override
  ThemeRectangleState createState() {
    return ThemeRectangleState();
  }
}

class ThemeRectangleState extends State<ThemeRectangle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )
      ),
    );
  }
}
