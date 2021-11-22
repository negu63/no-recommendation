import 'package:flutter/material.dart';
import 'package:norecommendation/core/theme/color_theme.dart';

final appLightThemeData = ThemeData.light().copyWith(
  primaryColor: Colors.white,
  toggleableActiveColor: darkGrey46,
);
final appDarkThemeData = ThemeData.dark().copyWith(
  primaryColor: darkGrey46,
  canvasColor: darkGrey46,
  textTheme: TextTheme(
    bodyText1: ThemeData.dark().textTheme.bodyText1!.copyWith(
          color: white95,
        ),
    headline5: ThemeData.dark().textTheme.headline5!.copyWith(
          color: white95,
        ),
  ),
);
