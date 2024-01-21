import 'package:flutter/material.dart';

import 'themes_color.dart';

enum AppThemeMode { primary, primaryDark, pink, blue, custom }

class AppColors {
  static AppThemes selectedTheme = AppThemes();

  static Color get primary => selectedTheme.selectedSchema.primary;

  static Color get onPrimary => selectedTheme.selectedSchema.onPrimary;

  static Color get secondary => selectedTheme.selectedSchema.secondary;

  static Color get onSecondary => selectedTheme.selectedSchema.onSecondary;

  static Color get primaryContainer =>
      selectedTheme.selectedSchema.primaryContainer;
      
  static Color get onPrimaryContainer =>
      selectedTheme.selectedSchema.onPrimaryContainer;

  static Color get secondaryContainer =>
      selectedTheme.selectedSchema.secondaryContainer;

  static Color get error => selectedTheme.selectedSchema.error;

  static Color get background => selectedTheme.selectedSchema.background;
  static Color get onBackground => selectedTheme.selectedSchema.onBackground;
  static Color get surface => selectedTheme.selectedSchema.surface;

  static Color get shadow => selectedTheme.selectedSchema.shadow;
  static Color get outline => selectedTheme.selectedSchema.outline;

  static Color get brightnessColor =>
      selectedTheme.selectedSchema.brightnessColor;
  static Color get brightnessColorInv =>
      selectedTheme.selectedSchema.brightnessColorInverse;
  static Brightness get brightness => selectedTheme.selectedSchema.brightness;
}
