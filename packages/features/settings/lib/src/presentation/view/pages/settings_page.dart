import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/src/presentation/cubit/cubit/settings_cubit.dart';
import 'package:starter_app/app/extensions/build_context_extensions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            _buildSection(
              context: context,
              children: [
                _buildSettingsTile(
                  title: 'Dark Mode',
                  trailing: Switch.adaptive(
                    value: context.theme.brightness == Brightness.dark,
                    onChanged: (value) {
                      context.read<SettingsCubit>().toggleTheme();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildSection(
              context: context,
              children: [
                _buildSettingsTile(
                  title: 'Sign Out',
                  titleColor: Colors.red,
                  onTap: () {
                    context.read<SettingsCubit>().signOut();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: context.theme.brightness == Brightness.dark
                ? Colors.white.withOpacity(0.05)
                : Colors.black.withOpacity(0.05),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingsTile({
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    Color? titleColor,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: titleColor,
                ),
              ),
              const Spacer(),
              if (trailing != null) trailing,
              if (onTap != null && trailing == null)
                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
