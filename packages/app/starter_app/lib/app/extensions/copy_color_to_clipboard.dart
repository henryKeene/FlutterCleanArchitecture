import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_app/app/extensions/color_extensions.dart';

/// Copy the color value as a String to the Clipboard in Flutter Dart format.
///
/// Notify with [SnackBar] that it was copied.
Future<void> copyColorToClipboard(BuildContext context, Color color) async {
  final data = ClipboardData(text: '0x${color.hexCode}');
  await Clipboard.setData(data);
  // Show a snack bar with the copy message.
  if (context.mounted) {
    final width = MediaQuery.sizeOf(context).width > 800.0 ? 700.0 : null;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: width,
        content: Row(
          children: <Widget>[
            Card(
              color: color,
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  '#${color.hexCode}',
                  style: TextStyle(
                    color: ThemeData.estimateBrightnessForColor(color) ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(child: Text('Copied color to the clipboard')),
          ],
        ),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }
}
