import 'package:core_theme/src/data/databases/theme_database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ThemeHandlerRepo {
  final ThemeDatabase _themeDatabase = ThemeDatabase();

  Future<ThemeMode> getCurrentTheme() async {
    final selectedTheme = await _themeDatabase.managers.themeTable
        .filter((f) => f.isSelected.equals(true))
        .getSingle();

    return switch (selectedTheme.id) {
      1 => ThemeMode.dark,
      2 => ThemeMode.light,
      _ => ThemeMode.dark
    };
  }

  Future<void> toggleTheme() async {
    await _themeDatabase.transaction(() async {
      final selectedTheme = await _themeDatabase.managers.themeTable
          .filter((f) => f.isSelected.equals(true))
          .getSingle();

      final newThemeId = selectedTheme.id == 1 ? 2 : 1;

      await _themeDatabase.managers.themeTable
          .filter((f) => f.id.equals(selectedTheme.id))
          .update(
            (o) => o(isSelected: const Value(false)),
          );

      await _themeDatabase.managers.themeTable
          .filter((f) => f.id.equals(newThemeId))
          .update(
            (o) => o(isSelected: const Value(true)),
          );
    });
  }

  Stream<ThemeMode> get themeStream => _themeDatabase.managers.themeTable
      .watch()
      .map((event) => event.firstWhere((e) => e.isSelected == true))
      .map(
        (e) => switch (e.id) {
          1 => ThemeMode.dark,
          2 => ThemeMode.light,
          _ => ThemeMode.dark
        },
      );
}
