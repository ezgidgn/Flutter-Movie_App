import 'package:flutter/material.dart';
import 'package:movie_project/mixin/color_mixin.dart';

class CustomTheme with ColorMixin {
  late ThemeData theme;
  CustomTheme() {
    theme = ThemeData.light().copyWith(
        scaffoldBackgroundColor: russianViolet,
        appBarTheme: AppBarTheme(
            backgroundColor: russianViolet, shadowColor: russianViolet),
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: white),
            filled: true,
            fillColor: thistle,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(style: BorderStyle.solid, color: white)),
            iconColor: white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(style: BorderStyle.solid, color: white),
            )),
        textTheme: TextTheme(
          headline4: TextStyle(color: white),
          bodyText2: TextStyle(color: white),
          subtitle1: TextStyle(color: white),
          headline6: TextStyle(color: white),
          
        ));
  }
}
