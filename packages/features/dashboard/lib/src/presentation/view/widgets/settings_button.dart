import 'package:dashboard/src/presentation/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lego_architecture_demo_mason/app/extensions/build_context_extensions.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      iconSize: 28,
      style: context.theme.filledButtonTheme.style?.copyWith(
        iconColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.onSurface,
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.all(12),
        ),
        shape: WidgetStateProperty.all(
          const CircleBorder(),
        ),
        backgroundColor: WidgetStateProperty.all(
          context.theme.brightness == Brightness.dark
              ? context.colorScheme.surfaceContainerHighest
              : context.colorScheme.surfaceContainerHigh,
        ),
      ),
      icon: const Icon(Icons.settings_outlined),
      onPressed: () {
        context.read<DashboardCubit>().navigateToSettings();
      },
    );
  }
}
