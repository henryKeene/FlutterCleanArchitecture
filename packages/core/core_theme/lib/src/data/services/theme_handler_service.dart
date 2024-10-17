import 'dart:async';

import 'package:core_theme/app_theme.dart';
import 'package:core_theme/src/data/repositories/theme_handler_repo.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IThemeHandlerService)
class ThemeHandlerService implements IThemeHandlerService {
  ThemeHandlerService(this._themeHandlerRepo);
  final ThemeHandlerRepo _themeHandlerRepo;

  @override
  Future<ThemeMode> getThemeMode() async {
    return _themeHandlerRepo.getCurrentTheme();
  }

  @override
  Future<void> toggleTheme() async {
    return _themeHandlerRepo.toggleTheme();
  }

  @override
  Stream<ThemeMode> get themeModeChanged => _themeHandlerRepo.themeStream;
}
