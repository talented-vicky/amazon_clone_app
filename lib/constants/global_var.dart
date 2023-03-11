import 'package:flutter/material.dart';

class GlobalVar {
  static const appBarGrad = LinearGradient(colors: [
    Color.fromARGB(225, 29, 201, 192),
    Color.fromARGB(225, 125, 221, 216)
  ], stops: [
    .5,
    1
  ]);

  // static const secColor = Color.fromRGBO(228, 115, 10, 1);
  static const secColor = Color.fromARGB(249, 228, 115, 10);
  static const backColor = Colors.white;
  static const greybackColor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[700];
  static var unselectedNavBarColor = Colors.black87;
  static var outlineColor = const Color.fromARGB(120, 12, 10, 10);
}
