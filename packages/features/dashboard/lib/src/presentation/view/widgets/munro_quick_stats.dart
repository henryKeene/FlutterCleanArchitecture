import 'package:core_munros_data/core_munros_data.dart';
import 'package:dashboard/src/presentation/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:lego_architecture_demo_mason/app/extensions/build_context_extensions.dart';

class MunroQuickStats extends StatelessWidget {
  const MunroQuickStats({required this.state, super.key});

  final DashboardLoaded state;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
