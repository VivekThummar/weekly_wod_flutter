import 'package:flutter/material.dart';
import 'package:weekly_wod_flutter/Constant/ColorConstants.dart';
import 'package:weekly_wod_flutter/Constant/FontConstant.dart';

class ToastView extends StatefulWidget {
  String msg;

  ToastView(this.msg, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ToastViewState();
  }
}

class ToastViewState extends State<ToastView> {

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ColorConstants.colorToastBg,
        ),
        child: Text(widget.msg, style: FontConstant.regular14White()),
      );

      // Custom Toast Position
      // fToast.showToast(
      //     child: toast,
      //     toastDuration: const Duration(seconds: 2),
      //     positionedToastBuilder: (context, child) {
      //       return Positioned(
      //         child: child,
      //         top: 16.0,
      //         left: 16.0,
      //       );
      //     });
  }
}