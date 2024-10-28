import 'package:core_munros_data/core_munros_data.dart';
import 'package:core_theme/app_theme.dart';
import 'package:dashboard/src/presentation/cubits/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lego_architecture_demo_mason/app/extensions/build_context_extensions.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.theme.brightness == Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDarkMode
            ? context.colorScheme.surfaceContainerHighest
            : context.colorScheme.surfaceContainerHigh,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) {
              return switch (state) {
                DashboardLoading() =>
                  const Center(child: CircularProgressIndicator()),
                DashboardLoaded() => Column(
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          shape: AppBarShape(),
                        ),
                        height: 250,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 60,
                                left: 16,
                                right: 16,
                              ),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SearchAnchor(
                                        suggestionsBuilder: (
                                          BuildContext context,
                                          SearchController controller,
                                        ) {
                                          return [
                                            const SizedBox.shrink(),
                                          ];
                                        },
                                        builder: (context, controller) =>
                                            SearchBar(
                                          onTap: () {
                                            controller.openView();
                                          },
                                          onChanged: (_) {
                                            controller.openView();
                                          },
                                          controller: controller,
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                            isDarkMode
                                                ? context.colorScheme
                                                    .surfaceContainerHighest
                                                : context.colorScheme
                                                    .surfaceContainerHigh,
                                          ),
                                          leading: const Icon(Icons.search),
                                          elevation:
                                              const WidgetStatePropertyAll(0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    IconButton.filled(
                                      iconSize: 28,
                                      style: context
                                          .theme.filledButtonTheme.style
                                          ?.copyWith(
                                        iconColor: WidgetStateProperty.all(
                                          Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        ),
                                        padding: const WidgetStatePropertyAll(
                                          EdgeInsets.all(12),
                                        ),
                                        shape: WidgetStateProperty.all(
                                          const CircleBorder(),
                                        ),
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          isDarkMode
                                              ? context.colorScheme
                                                  .surfaceContainerHighest
                                              : context.colorScheme
                                                  .surfaceContainerHigh,
                                        ),
                                      ),
                                      icon: const Icon(Icons.settings_outlined),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TopBarActionButton(
                                  label: 'View list',
                                  onPressed: () => context
                                      .read<DashboardCubit>()
                                      .navigateToMunroList(),
                                  icon: Icons.list_alt_rounded,
                                  backgroundColor: isDarkMode
                                      ? context
                                          .colorScheme.surfaceContainerHighest
                                      : context.colorScheme.primaryContainer,
                                  iconColor: isDarkMode
                                      ? context.colorScheme.primaryContainer
                                      : context.colorScheme.onPrimaryContainer,
                                ),
                                TopBarActionButton(
                                  label: 'Complete',
                                  onPressed: () => context
                                      .read<DashboardCubit>()
                                      .navigateToMunroList(
                                        onlyShowClimbed: true,
                                      ),
                                  backgroundColor: isDarkMode
                                      ? context
                                          .colorScheme.surfaceContainerHighest
                                      : context.colorScheme.secondaryContainer,
                                  icon: Icons.check_circle_outline,
                                  iconColor: isDarkMode
                                      ? context.colorScheme.primaryFixed
                                      : context
                                          .colorScheme.onSecondaryContainer,
                                ),
                                TopBarActionButton(
                                  label: 'Favorites',
                                  onPressed: () {},
                                  icon: Icons.favorite_border,
                                  backgroundColor: isDarkMode
                                      ? context
                                          .colorScheme.surfaceContainerHighest
                                      : context.colorScheme.tertiaryContainer,
                                  iconColor: isDarkMode
                                      ? context.colorScheme.tertiary
                                      : context.colorScheme.onTertiaryContainer,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  'Quick Stats',
                                  style: context.textTheme.titleLarge,
                                ),
                              ),
                              const SizedBox(height: 8),
                              GridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                padding: EdgeInsets.zero,
                                children: [
                                  _buildStatCard(
                                    context,
                                    icon: Icons.landscape,
                                    title: 'Climbed Munros',
                                    value: '${state.totalMunros}',
                                  ),
                                  _buildStatCard(
                                    context,
                                    icon: Icons.location_on,
                                    title: 'Favourite Region',
                                    value: state.mostClimbedRegion.title,
                                  ),
                                  _buildStatCard(
                                    context,
                                    icon: Icons.height,
                                    title: 'Distance Climbed',
                                    value: '${state.totalMetersClimbed}ft',
                                  ),
                                  _buildStatCard(
                                    context,
                                    icon: Icons.pie_chart,
                                    title: 'Completion',
                                    value: '${state.completionPercentage}%',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              };
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(
              title,
              style: context.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TopBarActionButton extends StatelessWidget {
  const TopBarActionButton({
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    super.key,
    this.onPressed,
  });

  final String label;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 110,
      child: FilledButton.tonal(
        style: context.theme.filledButtonTheme.style?.copyWith(
          iconColor: WidgetStateProperty.all(iconColor),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          overlayColor: WidgetStateProperty.all(iconColor?.withOpacity(0.15)),
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
