import 'package:core_munros_data/core_munros_data.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:munro_list/src/presentation/flow/munro_list_flow_state.dart';
import 'package:starter_app/app/extensions/build_context_extensions.dart';

class RegionsGrid extends StatelessWidget {
  const RegionsGrid({required this.regionsAndMunros, super.key});

  final Map<RegionEnum, List<Munro>> regionsAndMunros;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: regionsAndMunros.length,
      itemBuilder: (context, index) {
        final region = regionsAndMunros.keys.toList()[index];
        final munros = regionsAndMunros[region]!;

        if (munros.isEmpty) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: RegionCard(
            region: region,
            munrosCount: munros.length,
            onTap: () => _navigateToList(context, region, munros),
          ),
        );
      },
    );
  }

  void _navigateToList(
    BuildContext context,
    RegionEnum region,
    List<Munro> munros,
  ) {
    context.flow<MunroListFlowState>().update(
          (state) => ListState(
            region: region.title,
            munros: munros,
          ),
        );
  }
}

class RegionCard extends StatelessWidget {
  const RegionCard({
    required this.region,
    required this.munrosCount,
    required this.onTap,
    super.key,
  });

  final RegionEnum region;
  final int munrosCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                Icons.terrain,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      region.title,
                      style: context.textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$munrosCount Munros',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
