import 'dart:async';

import 'package:flutter/material.dart';
import 'package:starter_app/app/extensions/color_extensions.dart';
import 'package:starter_app/app/extensions/copy_color_to_clipboard.dart';

/// This is just simple SizedBox in a Card, with a passed in label, background
/// and text label color. Used to show the colors of a theme or scheme
/// color property.
///
/// It also has a tooltip to show the color code.
///
/// When you tap the ColorCard the color value is copied to the clipboard
/// in Dart format.
class ColorCard extends StatelessWidget {
  final String label;

  final Color color;
  final Color textColor;
  final Color? shadowColor;
  final Size? size;
  final double? elevation; // Defaults to 0 if not provided.
  const ColorCard({
    required this.label,
    required this.color,
    required this.textColor,
    super.key,
    this.shadowColor,
    this.size,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    const fontSize = 10.0;
    const effectiveSize = Size(74, 54);

    return RepaintBoundary(
      child: SizedBox(
        width: effectiveSize.width,
        height: effectiveSize.height,
        child: Tooltip(
          waitDuration: const Duration(milliseconds: 700),
          message: 'Color #${color.hexCode}\nTap to copy to Clipboard.',
          child: Card(
            elevation: elevation ?? 0,
            surfaceTintColor: Colors.transparent,
            shadowColor: shadowColor,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            color: color,
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: () {
                unawaited(copyColorToClipboard(context, color));
              },
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(color: textColor, fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
