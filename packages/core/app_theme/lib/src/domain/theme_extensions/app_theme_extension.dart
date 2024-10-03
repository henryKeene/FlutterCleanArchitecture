import 'package:app_theme/src/domain/theme_tokens.dart';
import 'package:app_theme/src/domain/widget_themes/text_theme.dart';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

/// A theme extension for semantic colors and content text styles.
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  // Fallback color value that is used for all colors in both theme modes.
  // This will never be seen when the theme extension is setup correctly.
  static const int _fail = 0xFF1565C0; // Bright dark blue

  // Constructor with our semantic order status colors in light mode.
  static const AppThemeExtension light = AppThemeExtension(
    received: ThemeTokens.receivedLight,
    onReceived: ThemeTokens.receivedDark,
    making: ThemeTokens.preparingLight,
    onMaking: ThemeTokens.preparingDark,
    inDelivery: ThemeTokens.deliveryLight,
    onInDelivery: ThemeTokens.deliveryDark,
    delivered: ThemeTokens.deliveredLight,
    onDelivered: ThemeTokens.deliveredDark,
  );
  // Constructor with our semantic order status colors in dark mode.
  static const AppThemeExtension dark = AppThemeExtension(
    received: ThemeTokens.receivedDark,
    onReceived: ThemeTokens.receivedLight,
    making: ThemeTokens.preparingDark,
    onMaking: ThemeTokens.preparingLight,
    inDelivery: ThemeTokens.deliveryDark,
    onInDelivery: ThemeTokens.deliveryLight,
    delivered: ThemeTokens.deliveredDark,
    onDelivered: ThemeTokens.deliveredLight,
  );
  final Color? received;
  final Color? onReceived;
  final Color? making;
  final Color? onMaking;
  final Color? inDelivery;
  final Color? onInDelivery;
  final Color? delivered;
  final Color? onDelivered;

  final TextStyle? blogHeader;

  final TextStyle? blogBody;

  const AppThemeExtension({
    required this.received,
    required this.onReceived,
    required this.making,
    required this.onMaking,
    required this.inDelivery,
    required this.onInDelivery,
    required this.delivered,
    required this.onDelivered,
    this.blogHeader,
    this.blogBody,
  });

  /// A factory to make the light or dark extended theme with its custom
  /// colors harmonized towards the used scheme primary color.
  /// The custom blog fonts can be zoomed.
  ///
  /// Since we are using theme extensions all changes to the theme properties
  /// will lerp animate when theme values are changed. Thus light/dark mode
  /// color changes in our custom colors automatically animate with the
  /// rest of the mode switch colors and when we turn ON/OFF the custom blog
  /// fonts zooming, this text style size change also animates.
  factory AppThemeExtension.make(ColorScheme scheme, bool zoom) {
    if (scheme.brightness == Brightness.light) {
      return light
          .copyWith(
            blogHeader: AppTextTheme.blogHeader(scheme, zoom ? 40 : 24),
            blogBody: AppTextTheme.blogBody(scheme, zoom ? 24 : 12),
          )
          .harmonized(scheme.primary);
    } else {
      return dark
          .copyWith(
            blogHeader: AppTextTheme.blogHeader(scheme, zoom ? 40 : 24),
            blogBody: AppTextTheme.blogBody(scheme, zoom ? 24 : 12),
          )
          .harmonized(scheme.primary);
    }
  }

  // You must override the copyWith method.
  @override
  AppThemeExtension copyWith({
    Color? received,
    Color? onReceived,
    Color? making,
    Color? onMaking,
    Color? inDelivery,
    Color? onInDelivery,
    Color? delivered,
    Color? onDelivered,
    TextStyle? blogHeader,
    TextStyle? blogBody,
  }) =>
      AppThemeExtension(
        received: received ?? this.received,
        onReceived: onReceived ?? this.onReceived,
        making: making ?? this.making,
        onMaking: onMaking ?? this.onMaking,
        inDelivery: inDelivery ?? this.inDelivery,
        onInDelivery: onInDelivery ?? this.onInDelivery,
        delivered: delivered ?? this.delivered,
        onDelivered: onDelivered ?? this.onDelivered,
        blogHeader: blogHeader ?? this.blogHeader,
        blogBody: blogBody ?? this.blogBody,
      );

  /// An [AppThemeExtension], where all its colors are harmonized towards a
  /// given [sourceColor], typically the theme's primary color.
  AppThemeExtension harmonized(Color sourceColor) {
    final source = sourceColor.value;
    return copyWith(
      received: Color(Blend.harmonize(received?.value ?? _fail, source)),
      onReceived: Color(Blend.harmonize(onReceived?.value ?? _fail, source)),
      making: Color(Blend.harmonize(making?.value ?? _fail, source)),
      onMaking: Color(Blend.harmonize(onMaking?.value ?? _fail, source)),
      inDelivery: Color(Blend.harmonize(inDelivery?.value ?? _fail, source)),
      onInDelivery:
          Color(Blend.harmonize(onInDelivery?.value ?? _fail, source)),
      delivered: Color(Blend.harmonize(delivered?.value ?? _fail, source)),
      onDelivered: Color(Blend.harmonize(onDelivered?.value ?? _fail, source)),
    );
  }

  // You must override the lerp method.
  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      received: Color.lerp(received, other.received, t),
      onReceived: Color.lerp(onReceived, other.onReceived, t),
      making: Color.lerp(making, other.making, t),
      onMaking: Color.lerp(onMaking, other.onMaking, t),
      inDelivery: Color.lerp(inDelivery, other.inDelivery, t),
      onInDelivery: Color.lerp(onInDelivery, other.onInDelivery, t),
      delivered: Color.lerp(delivered, other.delivered, t),
      onDelivered: Color.lerp(onDelivered, other.onDelivered, t),
      blogHeader: TextStyle.lerp(blogHeader, other.blogHeader, t),
      blogBody: TextStyle.lerp(blogBody, other.blogBody, t),
    );
  }
}
