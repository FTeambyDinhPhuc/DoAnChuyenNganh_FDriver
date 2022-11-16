import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';

class FgoTheme {
  //ligh mode
  static final lightTheme = ThemeData(
      fontFamily: "OpenSans",
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        color: scaffoldBackgroundColor,
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: primaryColor,
          ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
        headline2: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        headline3: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        headline4: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        headline5: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        headline6: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        bodyText1: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        bodyText2: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
        button: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ));

  //dark mode
  static final darkTheme = ThemeData();
}
