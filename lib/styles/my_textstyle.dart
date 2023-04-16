import 'package:flutter/material.dart';
import 'package:movieapp/styles/my_color.dart';

class MyTextStyles {
  static const buttonStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: MyColor.white,
    height: 1.5,
  );

  static TextStyle movieTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Colors.white.withOpacity(0.8),
    height: 1.5,
  );
  static TextStyle movieSubtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w200,
    color: Colors.white.withOpacity(0.8),
    height: 1.2,
  );
}
