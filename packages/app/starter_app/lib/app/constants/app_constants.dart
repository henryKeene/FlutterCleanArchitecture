import 'package:flutter/material.dart';

class AppConstants {
  static const String versionMajor = '1';
  static const String versionMinor = '0';
  static const String versionPatch = '0';
  static const String versionBuild = '01';
  static const String version = '$versionMajor.$versionMinor.$versionPatch';
  static const String author = 'ScreenMedia';
  static const String company = 'ScreenMedia';
  static const String copyright = '© 2024';
  static const String license = 'BSD 3-Clause License';
  static const String flutterVersion = 'stable 3.22.2';
  static String title(BuildContext context) =>
      (context as Element).findAncestorWidgetOfExactType<MaterialApp>()!.title;
}
