import 'package:bloc/bloc.dart';
import 'package:core_theme/app_theme.dart';
import 'package:flutter/material.dart';

part 'theme_handler_state.dart';

class ThemeHandlerCubit extends Cubit<ThemeHandlerState> {
  ThemeHandlerCubit(this._themeHandlerService) : super(ThemeDark());
  final IThemeHandlerService _themeHandlerService;

  Future<void> initialise() async {
    await _getTheme();

    _themeHandlerService.themeModeChanged.listen((themeMode) {
      emit(
        switch (themeMode) {
          ThemeMode.light => ThemeLight(),
          ThemeMode.dark => ThemeDark(),
          ThemeMode.system => ThemeDark(),
        },
      );
    });
  }

  Future<void> _getTheme() async {
    final themeMode = await _themeHandlerService.getThemeMode();
    emit(
      switch (themeMode) {
        ThemeMode.light => ThemeLight(),
        ThemeMode.dark => ThemeDark(),
        ThemeMode.system => ThemeDark(),
      },
    );
  }
}
