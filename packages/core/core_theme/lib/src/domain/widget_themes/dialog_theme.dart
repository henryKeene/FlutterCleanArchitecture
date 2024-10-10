import 'package:flutter/material.dart';

class AppDialogTheme {
  static DatePickerThemeData datePickerTheme(
    ColorScheme scheme, {
    required bool isLight,
  }) {
    return DatePickerThemeData(
      backgroundColor:
          isLight ? scheme.surfaceContainerLow : scheme.surfaceContainerHigh,
      headerBackgroundColor: scheme.primaryContainer,
      headerForegroundColor: scheme.onPrimaryContainer,
      dividerColor: Colors.transparent,
      shadowColor: scheme.shadow,
    );
  }

  // We use a custom dialog theme with a custom color mapping and shadow.
  static DialogTheme dialogTheme(ColorScheme scheme, {required bool isLight}) {
    return DialogTheme(
      backgroundColor:
          isLight ? scheme.surfaceContainerLow : scheme.surfaceContainerHigh,
      shadowColor: scheme.shadow,
    );
  }

  static TimePickerThemeData timePickerTheme(
    ColorScheme scheme, {
    required bool isLight,
  }) {
    return TimePickerThemeData(
      backgroundColor:
          isLight ? scheme.surfaceContainerLow : scheme.surfaceContainerHigh,
    );
  }
}
