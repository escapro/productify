import 'package:flutter/material.dart';
import 'package:productify/constans.dart';

ThemeData defaultThemeData(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.light(primary: kPrimaryColor),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
    fontFamily: 'Montserrat',
    appBarTheme: AppBarTheme(
      color: Colors.white,
      centerTitle: true,
      elevation: 1
    ),
  );
}

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    primaryTextTheme: TextTheme(
      // title: TextStyle(
      //   color: kTextColorBlack
      // )
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 1,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: kPageTitleColor,
        backgroundColor: Colors.yellow
      )
    )
  );
}
