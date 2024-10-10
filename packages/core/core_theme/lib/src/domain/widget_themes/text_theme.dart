import 'package:core_theme/src/domain/utils/text_style_fix.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  // 23 a) Get our custom GoogleFonts primaryTextTheme: poppins
  // Issue: https://github.com/material-foundation/flutter-packages/issues/401
  static TextTheme get googleFontsTextTheme {
    // Add ".fixColors", remove it to see how text color breaks.
    return GoogleFonts.poppinsTextTheme().fixColors;
  }

  // 22 a) Make a TextTheme from TextStyles to customize fonts per style.
  static TextTheme get textThemeFromStyles {
    final light = GoogleFonts.lato(fontWeight: FontWeight.w300);
    final regular = GoogleFonts.poppins(fontWeight: FontWeight.w400);
    final medium = GoogleFonts.poppins(fontWeight: FontWeight.w500);
    final semiBold = GoogleFonts.poppins(fontWeight: FontWeight.w600);

    return TextTheme(
      displayLarge: light.copyWith(fontSize: 54), // Default: regular, Size 57
      displayMedium: light.copyWith(fontSize: 42), // Default: regular
      displaySmall: light, // Default: regular
      headlineLarge: regular, //Default: regular
      headlineMedium: regular, // Default: regular
      headlineSmall: regular, // Default: regular
      titleLarge: semiBold.copyWith(fontSize: 20), // Default: regular, Size 22
      titleMedium: medium, // Default: medium
      titleSmall: medium, // Default: medium
      bodyLarge: regular, // Regular is default
      bodyMedium: regular, // Regular is default
      bodySmall: regular, // Regular is default
      labelLarge: medium.copyWith(fontSize: 15), // Default: medium, Size 14
      labelMedium: medium, // Default: medium
      labelSmall: medium, // Default: medium
    );
  }

  // 25) Make a totally custom text style for a component theme: AppBar
  //
  // Generally don't try to change the app's TexTheme and its TextStyle to make
  // a given component use a different style by adjusting the default style in
  // the ThemeData TextTheme it uses. Many other components may use the same
  // style as their default, and you may not want them to use the same style.
  // Instead make a new TextStyle that fits your component and use it in the
  // component theme.
  static TextStyle appBarTextStyle(ColorScheme scheme) {
    return GoogleFonts.lobster(
      fontWeight: FontWeight.w400,
      fontSize: 26,
      color: scheme.primary,
    );
  }

  // 27) A "semantic" blog body text style that we use for custom content.
  static TextStyle blogBody(ColorScheme scheme, double fontSize) {
    return GoogleFonts.notoSerif(
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: scheme.onSurface,
    );
  }

  // 26) A "semantic" blog header text style that we use for custom content.
  //
  // Generally don't try to change the app's TexTheme and its TextStyle to fit
  // your content, instead make a new TextStyle that fits your content.
  // Then add it as a ThemeExtension to ThemeData.
  static TextStyle blogHeader(ColorScheme scheme, double fontSize) {
    return GoogleFonts.limelight(
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: scheme.onSurface,
    );
  }
}
