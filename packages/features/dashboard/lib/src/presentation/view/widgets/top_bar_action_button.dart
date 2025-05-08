import 'package:dashboard/src/domain/enum/top_bar_action_button_enums.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/app/extensions/build_context_extensions.dart';

class TopBarActionButton extends StatelessWidget {
  const TopBarActionButton({
    required this.label,
    required this.icon,
    required this.type,
    super.key,
    this.onPressed,
  });

  final String label;
  final IconData icon;
  final TopBarActionButtonEnum type;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.theme.brightness == Brightness.dark;

    final iconColor = switch (type) {
      TopBarActionButtonEnum.primary => isDarkMode
          ? context.colorScheme.primaryContainer
          : context.colorScheme.onPrimaryContainer,
      TopBarActionButtonEnum.secondary => isDarkMode
          ? context.colorScheme.primaryFixed
          : context.colorScheme.onSecondaryContainer,
      TopBarActionButtonEnum.tertiary => isDarkMode
          ? context.colorScheme.tertiary
          : context.colorScheme.onTertiaryContainer,
    };
    final backgroundColor = switch (type) {
      TopBarActionButtonEnum.primary => isDarkMode
          ? context.colorScheme.surfaceContainerHighest
          : context.colorScheme.primaryContainer,
      TopBarActionButtonEnum.secondary => isDarkMode
          ? context.colorScheme.surfaceContainerHighest
          : context.colorScheme.secondaryContainer,
      TopBarActionButtonEnum.tertiary => isDarkMode
          ? context.colorScheme.surfaceContainerHighest
          : context.colorScheme.tertiaryContainer,
    };
    return SizedBox(
      height: 75,
      width: 110,
      child: FilledButton.tonal(
        style: context.theme.filledButtonTheme.style?.copyWith(
          iconColor: WidgetStateProperty.all(iconColor),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          overlayColor: WidgetStateProperty.all(
            iconColor.withOpacity(0.15),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
            ),
            Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
