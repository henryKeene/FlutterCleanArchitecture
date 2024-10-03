import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeSystem());

  void setThemeDark() => emit(ThemeDark());

  void setThemeLight() => emit(ThemeLight());

  void setThemeSystem() => emit(ThemeSystem());

  void toggleTheme() {
    switch (state) {
      case ThemeDark():
        setThemeLight();
      case ThemeLight():
        setThemeDark();
      case ThemeSystem():
        setThemeLight();
    }
  }
}
