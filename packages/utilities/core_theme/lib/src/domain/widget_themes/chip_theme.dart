import 'package:core_theme/src/domain/theme_tokens.dart';
import 'package:core_theme/src/domain/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppChipTheme {
  // We want Chips with custom color mapping and a platform adaptive shape.
  // We make them stadium shaped on none Android platform to not look like
  // the buttons, while on Android they using default slightly rounded
  // corners. We also want smaller and more compact Chips. The Chips
  // grew so big in default Material-3 design that they almost look like
  // buttons, we want them to be more compact.
  static ChipThemeData chipTheme(ColorScheme scheme, {required bool isLight}) {
    return ChipThemeData(
      labelStyle: AppTextTheme.textThemeFromStyles.labelSmall!
          .copyWith(color: scheme.onSurface),
      padding: const EdgeInsets.all(4),
      backgroundColor:
          isLight ? scheme.primaryContainer : scheme.outlineVariant,
      shape: ThemeTokens.isNotAndroidOrIsWeb ? const StadiumBorder() : null,
    );
  }
}
