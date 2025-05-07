import 'package:core_theme/src/domain/app_color_scheme.dart';
import 'package:core_theme/src/domain/models/theme_settings.dart';
import 'package:core_theme/src/domain/theme_extensions/app_theme_extension.dart';
import 'package:core_theme/src/domain/theme_tokens.dart';
import 'package:core_theme/src/domain/utils/comfortable_platform_density.dart';
import 'package:core_theme/src/domain/utils/instant_splash.dart';
import 'package:core_theme/src/domain/widget_themes/app_bar_theme.dart';
import 'package:core_theme/src/domain/widget_themes/button_theme.dart';
import 'package:core_theme/src/domain/widget_themes/chip_theme.dart';
import 'package:core_theme/src/domain/widget_themes/dialog_theme.dart';
import 'package:core_theme/src/domain/widget_themes/input_decoration_theme.dart';
import 'package:core_theme/src/domain/widget_themes/switch_theme.dart';
import 'package:core_theme/src/domain/widget_themes/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// The platform adaptive application theme design for our app.
sealed class AppTheme {
  /// Select the used theme, based on theme settings and brightness.
  static ThemeData use(Brightness brightness, ThemeSettings settings) {
    // Check if theme is light or dark, used repeatedly later in theming.
    final isLight = brightness == Brightness.light;
    // Get our app color scheme based on the brightness.
    final scheme = isLight ? AppColorScheme.light : AppColorScheme.dark;
    // Get the visual density based on the platform.
    final visualDensity = comfortablePlatformDensity;
    return ThemeData(
      // We should always use M3 unless we have a very good reason not to.
      useMaterial3: settings.useMaterial3,
      // Pass the ColorScheme to the theme.
      colorScheme: scheme,
      // Make sure our theme and its colors apply to all Cupertino widgets,
      // without this `CupertinoSwitch` and `Switch.adaptive` will use the
      // default iOS colors, system green, we do not want that, we want it to
      // match our primary color.
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      // Add our custom density depending on the platform,
      // desktop and web have lower density.
      visualDensity: visualDensity,
      // Add our custom instant splash factory on none Android and web
      // platforms. For the Android we pass null so we get the defaults.
      splashFactory:
          ThemeTokens.isNotAndroidOrIsWeb ? InstantSplash.splashFactory : null,
      // We use M3 Typography, even if you still use M2 mode I recommend this
      // as it is a much nicer default.
      typography: Typography.material2021(
        platform: defaultTargetPlatform,
        colorScheme: scheme,
      ),
      // Fix the ThemeData legacy divider color to match our ColorScheme.
      // Planned to be deprecated in ThemeData.
      dividerColor: scheme.outlineVariant,
      // Fix legacy primary colors and secondary header color.
      // Planned to be deprecated in ThemeData.
      primaryColor: scheme.primary,
      primaryColorDark: isLight ? scheme.secondary : scheme.onPrimary,
      primaryColorLight: isLight ? scheme.secondaryContainer : scheme.secondary,
      secondaryHeaderColor:
          isLight ? scheme.primaryContainer : scheme.secondaryContainer,
      // Fix legacy surface colors.
      // Planned to be deprecated in ThemeData.
      canvasColor: scheme.surface,
      cardColor: scheme.surface,
      scaffoldBackgroundColor: scheme.surface,
      dialogBackgroundColor: scheme.surface,
      appBarTheme: AppAppBarTheme.appBarTheme(scheme, isLight: isLight),
      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme(scheme),
      filledButtonTheme: AppButtonTheme.filledButtonTheme(scheme),
      outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme(scheme),
      textButtonTheme: AppButtonTheme.textButtonTheme(scheme),
      toggleButtonsTheme:
          AppButtonTheme.toggleButtonsTheme(scheme, visualDensity),
      segmentedButtonTheme: AppButtonTheme.segmentedButtonThemeData(scheme),
      buttonTheme: AppButtonTheme.buttonThemeData(scheme),
      floatingActionButtonTheme:
          AppButtonTheme.floatingActionButtonThemeData(scheme),
      chipTheme: AppChipTheme.chipTheme(scheme, isLight: isLight),
      // On other than Android platforms we use an iOS like `Switch` theme,
      // but on Android we use the default style.
      switchTheme: ThemeTokens.isNotAndroidOrIsWeb
          ? AppSwitchTheme.switchTheme(scheme)
          : null,
      navigationBarTheme:
          AppAppBarTheme.navigationBarTheme(scheme, isLight: isLight),
      inputDecorationTheme: AppInputDecorationTheme.inputTheme(scheme),
      // We need to match the dropdown menu to the input decoration theme.
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: AppInputDecorationTheme.inputTheme(scheme),
      ),
      dialogTheme: AppDialogTheme.dialogTheme(scheme, isLight: isLight),
      timePickerTheme: AppDialogTheme.timePickerTheme(scheme, isLight: isLight),
      bottomNavigationBarTheme:
          AppAppBarTheme.bottomNavigationBarTheme(scheme, isLight: isLight),
      datePickerTheme: AppDialogTheme.datePickerTheme(scheme, isLight: isLight),
      textTheme: AppTextTheme.textThemeFromStyles,
      primaryTextTheme: AppTextTheme.googleFontsTextTheme,
      // Add theme extensions here for custom properties.
      // https://medium.com/@alexandersnotes/flutter-custom-theme-with-themeextension-792034106abc
      // if confused by Theme extensions, see the link above. They are a way to
      // add custom properties to the ThemeData. which means it will be
      // automatically switched with light and dark modes
      // and keeps all theme properties in one place.
      extensions: <ThemeExtension<dynamic>>{
        AppThemeExtension.make(scheme, settings.zoomBlogFonts),
      },
    );
  }
}
