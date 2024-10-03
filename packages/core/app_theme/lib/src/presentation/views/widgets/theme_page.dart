import 'package:app_theme/src/presentation/cubit/cubit/theme_cubit.dart';
import 'package:app_theme/src/presentation/views/widgets/about.dart';
import 'package:app_theme/src/presentation/views/widgets/show_color_scheme_colors.dart';
import 'package:app_theme/src/presentation/views/widgets/show_sub_theme_colors.dart';
import 'package:app_theme/src/presentation/views/widgets/show_theme_data_colors.dart';
import 'package:app_theme/src/presentation/views/widgets/showcase_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineMedium = Theme.of(context).textTheme.headlineMedium;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        actions: <Widget>[
          IconButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            icon: const Icon(Icons.light_mode),
          ),
          const AboutIconButton(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        primary: true,
        children: <Widget>[
          Text('Widgets Demo', style: headlineMedium),
          const Text(
            'This screen shows an example page with the same '
            'ThemeData inherited theme being used. It also has a '
            'NavigationBar and a TabBar in the AppBar',
          ),
          const SizedBox(height: 8),
          // Show all key active theme colors.
          Text('Colors', style: headlineMedium),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ShowColorSchemeColors(showColorValue: false),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ShowThemeDataColors(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ShowSubThemeColors(),
          ),
          const SizedBox(height: 16),
          Text('Theme Showcase', style: headlineMedium),
          const ShowcaseMaterial(),
        ],
      ),
    );
  }
}
