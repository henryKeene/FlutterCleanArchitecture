import 'package:core_theme/src/domain/theme_tokens.dart';
import 'package:core_theme/src/domain/widget_themes/text_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppAppBarTheme {
  // We use a custom AppBarTheme with a custom color mapping with slight
  // opacity and very minor scroll under elevation that with shadow
  // will look like a faint underline in light theme mode.
  static AppBarTheme appBarTheme(
    ColorScheme scheme, {
    required bool isLight,
  }) {
    return AppBarTheme(
      backgroundColor: isLight
          ? scheme.surfaceContainerLow.withOpacity(0.96)
          : scheme.surfaceContainer.withOpacity(0.95),
      foregroundColor: scheme.secondary,
      elevation: 0,
      scrolledUnderElevation: isLight ? 0.5 : 2,
      shadowColor: scheme.shadow,
      centerTitle: defaultTargetPlatform == TargetPlatform.iOS,
      surfaceTintColor:
          ThemeTokens.isNotAndroidOrIsWeb ? scheme.outline : scheme.primary,
      // Adding this shape makes the scroll under effect animate as it should.
      // See issue: https://github.com/flutter/flutter/issues/131042
      shape: const RoundedRectangleBorder(),
      titleTextStyle: AppTextTheme.appBarTextStyle(scheme),
    );
  }

  // Bottom Nav bar is desisigned to look like app bar. With slight opacity
  static BottomNavigationBarThemeData bottomNavigationBarTheme(
    ColorScheme scheme, {
    required bool isLight,
  }) {
    return BottomNavigationBarThemeData(
      backgroundColor: isLight
          ? scheme.surfaceContainerLow.withOpacity(0.96)
          : scheme.surfaceContainer.withOpacity(0.95),
      selectedItemColor: scheme.primary,
      unselectedItemColor: scheme.onSurfaceVariant,
      selectedIconTheme: const IconThemeData(size: 24),
      unselectedIconTheme: const IconThemeData(size: 24),
      selectedLabelStyle: AppTextTheme.textThemeFromStyles.labelSmall!.copyWith(
        color: scheme.primary,
      ),
      unselectedLabelStyle:
          AppTextTheme.textThemeFromStyles.labelSmall!.copyWith(
        color: scheme.onSurfaceVariant,
      ),
    );
  }

  // We want a navigation bar that is slightly transparent and with more
  // distinct and clear selection indication. Also the default height 80dp
  // wastes vertical space, so we make it less tall.
  // The default background in light mode is also a bit too dark, we
  // make it a bit lighter in light mode.
  static NavigationBarThemeData navigationBarTheme(
    ColorScheme scheme, {
    required bool isLight,
  }) {
    return NavigationBarThemeData(
      height: 72,
      backgroundColor: isLight
          ? scheme.surfaceContainerLow.withOpacity(0.96)
          : scheme.surfaceContainer.withOpacity(0.95),
      indicatorColor: scheme.secondaryContainer,
      iconTheme: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        return IconThemeData(
          size: 24,
          color: states.contains(WidgetState.disabled)
              ? scheme.onSurfaceVariant.withOpacity(0.38)
              : states.contains(WidgetState.selected)
                  ? scheme.onSecondaryContainer
                  : scheme.onSurfaceVariant,
        );
      }),
    );
  }
}
