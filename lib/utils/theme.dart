import 'package:flutter/material.dart';
import 'package:nuntium/utils/colors.dart';
import 'package:nuntium/utils/constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: purplePrimary,
    accentColor: greyPrimary,
    fontFamily: AvailableFonts.primaryFont,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
