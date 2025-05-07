import 'package:core_theme/src/domain/interface/i_theme_handler_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._themeHandlerService) : super(ThemeInitial());
  final IThemeHandlerService _themeHandlerService;

  void toggleTheme() {
    _themeHandlerService.toggleTheme();
  }
}
