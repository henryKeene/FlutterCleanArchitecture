import 'package:core_theme/src/domain/theme_tokens.dart';
import 'package:flutter/material.dart';

class AppButtonTheme {
  // The old button theme still has some usage, like aligning the
  // DropdownButton and DropdownButtonFormField to their parent.
  static ButtonThemeData buttonThemeData(ColorScheme scheme) {
    return const ButtonThemeData(alignedDropdown: true);
  }

  // ElevatedButton with custom color mapping and adaptive shape.
  // Changing the default color where the primary color is used as foreground
  // color but this ends up with less color and boring elevated button.
  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme scheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primaryContainer,
        foregroundColor: scheme.onPrimaryContainer,
        shape:
            ThemeTokens.isNotAndroidOrIsWeb ? ThemeTokens.buttonsShape : null,
      ),
    );
  }

  //Filled button Theme - Custom adaptive shape
  static FilledButtonThemeData filledButtonTheme(ColorScheme scheme) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape:
            ThemeTokens.isNotAndroidOrIsWeb ? ThemeTokens.buttonsShape : null,
      ),
    );
  }

  // FloatingActionButton.
  // With custom color mapping and classic round and stadium shapes.
  static FloatingActionButtonThemeData floatingActionButtonThemeData(
    ColorScheme scheme,
  ) {
    return FloatingActionButtonThemeData(
      backgroundColor: scheme.primaryContainer,
      foregroundColor: scheme.onPrimaryContainer,
      shape: const StadiumBorder(),
    );
  }

  //Outlined button Theme - Custom adaptive shape
  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme scheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape:
            ThemeTokens.isNotAndroidOrIsWeb ? ThemeTokens.buttonsShape : null,
      ),
    );
  }

  // SegmentedButton, made to match the filled tonal button, but with
  // an outline.
  static SegmentedButtonThemeData segmentedButtonThemeData(ColorScheme scheme) {
    return SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
        shape:
            ThemeTokens.isNotAndroidOrIsWeb ? ThemeTokens.buttonsShape : null,
      ),
    );
  }

  //Text button Theme - Custom adaptive shape
  static TextButtonThemeData textButtonTheme(ColorScheme scheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape:
            ThemeTokens.isNotAndroidOrIsWeb ? ThemeTokens.buttonsShape : null,
      ),
    );
  }

  // ToggleButtons Theme, made to match the filled and outline buttons.
  static ToggleButtonsThemeData toggleButtonsTheme(
    ColorScheme scheme,
    VisualDensity visualDensity,
  ) {
    return ToggleButtonsThemeData(
      borderWidth: ThemeTokens.outlineWidth,
      selectedColor: scheme.onPrimary,
      color: scheme.primary,
      fillColor: scheme.primary,
      borderColor: scheme.outline,
      selectedBorderColor: scheme.primary,
      hoverColor: scheme.primary.withAlpha(0x14),
      focusColor: scheme.primary.withAlpha(0x1F),
      highlightColor: scheme.primary.withAlpha(0x14),
      splashColor: scheme.primary.withAlpha(0x1F),
      disabledColor: scheme.onSurface.withAlpha(0x61),
      disabledBorderColor: scheme.onSurface.withAlpha(0x1F),
      borderRadius: ThemeTokens.isNotAndroidOrIsWeb
          ? ThemeTokens.borderRadius
          : ThemeTokens.borderRadiusStadiumLike,
      constraints: BoxConstraints(
        minWidth: ThemeTokens.toggleButtonMinSize.width -
            ThemeTokens.outlineWidth * 2 +
            visualDensity.baseSizeAdjustment.dx,
        minHeight: ThemeTokens.toggleButtonMinSize.height -
            ThemeTokens.outlineWidth * 2 +
            visualDensity.baseSizeAdjustment.dy,
      ),
    );
  }
}
