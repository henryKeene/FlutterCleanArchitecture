import 'package:flutter/material.dart';

extension AppConfigX on BuildContext {
  ColorScheme get colorScheme => theme.colorScheme;
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  double get height => mediaQuery.size.height;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  NavigatorState get navigator => Navigator.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  TextTheme get textTheme => theme.textTheme;
  ThemeData get theme => Theme.of(this);
  double get width => mediaQuery.size.width;
}
