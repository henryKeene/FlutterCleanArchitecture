import 'package:dashboard/src/domain/enum/top_bar_action_button_enums.dart';
import 'package:dashboard/src/presentation/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:dashboard/src/presentation/view/widgets/munro_quick_stats.dart';
import 'package:dashboard/src/presentation/view/widgets/munro_search_bar.dart';
import 'package:dashboard/src/presentation/view/widgets/settings_button.dart';
import 'package:dashboard/src/presentation/view/widgets/top_bar_action_button.dart';
import 'package:dashboard/src/presentation/view/widgets/top_bar_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/app/extensions/build_context_extensions.dart';

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
                      TopBarContainer(
                        searchBarWidgets: const [
                          MunroSearchBar(),
                          SizedBox(width: 8),
                          SettingsButton(),
                        ],
                        bottomActions: [
                          TopBarActionButton(
                            label: 'View list',
                            onPressed: () => context
                                .read<DashboardCubit>()
                                .navigateToMunroList(),
                            icon: Icons.list_alt_rounded,
                            type: TopBarActionButtonEnum.primary,
                          ),
                          TopBarActionButton(
                            label: 'Complete',
                            onPressed: () => context
                                .read<DashboardCubit>()
                                .navigateToMunroList(
                                  onlyShowClimbed: true,
                                ),
                            icon: Icons.check_circle_outline,
                            type: TopBarActionButtonEnum.secondary,
                          ),
                          TopBarActionButton(
                            label: 'Favorites',
                            onPressed: () {},
                            icon: Icons.favorite_border,
                            type: TopBarActionButtonEnum.tertiary,
                          ),
                        ],
                      ),
                      MunroQuickStats(state: state),
                    ],
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
