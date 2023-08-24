import 'package:flutter/material.dart';

class Move {
  static nativeNavigatePush(context, Widget child) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => child,
      ));

  static navigatorAllOff(context, Widget child) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => child,
      ),
      (Route<dynamic> route) => false);
}
