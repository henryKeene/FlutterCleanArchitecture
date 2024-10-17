part of 'theme_handler_cubit.dart';

@immutable
sealed class ThemeHandlerState {}

final class ThemeLight extends ThemeHandlerState {}

final class ThemeDark extends ThemeHandlerState {}
