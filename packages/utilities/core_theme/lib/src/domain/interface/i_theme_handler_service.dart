import 'package:flutter/material.dart';

abstract interface class IThemeHandlerService {
  Future<void> toggleTheme();
  Future<ThemeMode> getThemeMode();
  Stream<ThemeMode> get themeModeChanged;
}
