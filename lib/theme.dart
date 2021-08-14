import 'package:flutter/material.dart';

Color whiteC = Colors.white;
Color inActive = Colors.grey;
Color statusBarC = Color(0xffa78dce);
Color inActiveDotC = Color(0xffd1ced5);

final kLightTheme = ThemeData.light().copyWith(
  backgroundColor:  Color(0xffF4F4F4),
  primaryColor:  Color(0xff4324A1),
  selectedRowColor: Color(0xff453855),
  appBarTheme: AppBarTheme(
      color: Color(0xff3925A1),
  ),
);

final kDarkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.pink,
  appBarTheme: AppBarTheme(
      color: Colors.black
  ),
);

