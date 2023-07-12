import 'package:flutter/material.dart';

import 'ui_colors.dart';

class PrimaryFont {
  static const String fontFamily = 'Inter';

  static TextStyle light({double fontSize = 14, Color color = UiColors.text}) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        fontFamily: fontFamily,
      );

  static TextStyle regular({double fontSize = 14, Color color = UiColors.text}) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
      );

  static TextStyle medium({double fontSize = 14, Color color = UiColors.text}) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
      );

  static TextStyle semiBold({double fontSize = 14, Color color = UiColors.text}) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
      );

  static TextStyle bold({double fontSize = 14, Color color = UiColors.text}) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: fontFamily,
      );

  static TextStyle extraBold({double fontSize = 14, Color color = UiColors.text}) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        fontFamily: fontFamily,
      );

  static TextStyle black({double fontSize = 14, Color color = UiColors.text}) => TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        fontFamily: fontFamily,
      );
}
