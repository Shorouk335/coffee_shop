import 'package:flutter/material.dart';

import 'colors_schema.dart';

class AppThemes {
  // singleton
  AppThemes._internal();
  static final AppThemes _instance = AppThemes._internal();
  factory AppThemes() => _instance;

  changeCustomScheme(String color, Brightness brightness) {
    final hexColors = int.parse(color, radix: 16);
    final Color colors = Color(hexColors);

    selectedSchema = const AppColorScheme().fromColor(colors, brightness);
  }

  changeBrightness(Brightness brightness) {
    selectedSchema =
        const AppColorScheme().fromColor(selectedSchema.primary, brightness);
  }

  AppColorScheme selectedSchema = const AppColorScheme(
    brightness: Brightness.light,

    background: Color(0xffF6F2ED),
    onBackground: Color(0xffD5BBA2),
    primary: Color(0xff4B2C20), // بني
    onPrimary: Color(0xffA67C52), // بني فاتح
    secondary: Color(0xff4E8D7C), // الاخضر
    // onSecondary: Color(0xffB4B4B4), // الغامق  الرصاصي  زرار
    // primaryContainer: Color(0xff999999), // رصاصي البوتوم ناف
    // onPrimaryContainer: Color(0xff737373),  // رصاصي غامق
    // secondaryContainer: Color(0xffF2F2F7), // الرصاصي الفاتح
    error: Color(0xffF83E3E),
    surface: Color(0xff1f222a),
    shadow: Color(0xff1f222a),
    outline: Color(0xffc5c6d0),
  );
}
