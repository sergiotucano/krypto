import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  return ThemeData(
    primaryColor: const Color(0xFFFFFFFF),
    primaryColorDark: const Color(0xFFFFFFFF),
    primaryColorLight: const Color(0xFFFFFFFF),
    accentColor: const Color(0xFFFF8000),
    primaryColorBrightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: const Color(0xFF333333),
        letterSpacing: 1.1,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      headline5: TextStyle(
        color: const Color(0xFFFF8000),
        letterSpacing: 1.1,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        color: const Color(0xFFFF8000),
        letterSpacing: 1.1,
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
