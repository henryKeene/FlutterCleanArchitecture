import 'package:flutter/material.dart';

class AppSwitchTheme {
  // If we use `Switch.adaptive` we will get the actual iOS Switch design on
  // iOS and macOS, it will use the ColorScheme colors and not iOS default
  // system green, because we used the `cupertinoOverrideTheme:`
  // `const CupertinoThemeData(applyThemeToAll: true)` in our `ThemeData`
  // earlier.
  // The none iOS and macOS adaptive response for `Switch.adaptive`
  // will be the themed `Switch` that will use the Android default style on
  // Android, but the themed iOS look alike `Switch` on Windows and Linux.
  // The intention is that feels familiar on iOS and that it can also be used as
  // a platform agnostic Switch on other platforms than Android.
  static SwitchThemeData switchTheme(ColorScheme scheme) {
    final isLight = scheme.brightness == Brightness.light;
    return SwitchThemeData(
      thumbIcon:
          WidgetStateProperty.resolveWith<Icon?>((Set<WidgetState> states) {
        return const Icon(Icons.minimize, color: Colors.transparent);
      }),
      trackOutlineColor:
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return Colors.transparent;
      }),
      trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          if (states.contains(WidgetState.selected)) {
            return scheme.primary.withOpacity(0.5);
          }
          return scheme.onSurface.withOpacity(0.07);
        }
        if (states.contains(WidgetState.selected)) {
          return scheme.primary;
        }
        return scheme.surfaceContainerHighest;
      }),
      thumbColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return isLight ? scheme.surface : scheme.onSurface.withOpacity(0.7);
        }
        return Colors.white;
      }),
    );
  }
}
