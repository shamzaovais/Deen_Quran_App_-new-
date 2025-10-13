import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void buildFlashbar(BuildContext context, String message,
    {Color backgroundColor = Colors.black, IconData? icon}) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,

    backgroundColor: backgroundColor,
    icon: Icon(icon, color: Colors.white),
    duration: Duration(seconds: 3),
    margin:  EdgeInsets.all(18),
    borderRadius: BorderRadius.circular(8),
  )..show(context);
}
