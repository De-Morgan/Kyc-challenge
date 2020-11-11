import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Widget showFeedback(BuildContext context, String msg,
    {String title = "Read me",
    FlushbarPosition position = FlushbarPosition.TOP,
    FlatButton flatButton}) {
  return Flushbar(
    title: title,
    message: msg,
    isDismissible: true,
    mainButton: flatButton,
    flushbarStyle: FlushbarStyle.GROUNDED,
    flushbarPosition: position,
    // backgroundGradient: paidLinearGradient,
    duration: const Duration(seconds: 5),
  )..show(context);
}
