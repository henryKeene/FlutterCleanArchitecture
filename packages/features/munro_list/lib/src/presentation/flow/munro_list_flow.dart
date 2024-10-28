import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munro_list/src/domain/di/di_init.dart';
import 'package:munro_list/src/presentation/cubits/munros_cubit/munros_cubit.dart';
import 'package:munro_list/src/presentation/flow/munro_list_flow_state.dart';
import 'package:munro_list/src/presentation/view/pages/munros_list_page.dart';
import 'package:munro_list/src/presentation/view/pages/region_grid_page.dart';

class MunroListFlow extends StatefulWidget {
  const MunroListFlow({required this.onlyShowClimbed, super.key});

  final bool onlyShowClimbed;

  @override
  State<MunroListFlow> createState() => _DashboardFlowState();
}

class _DashboardFlowState extends State<MunroListFlow> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MunrosCubit>()
        ..loadMunros(onlyShowClimbed: widget.onlyShowClimbed),
      child: FlowBuilder<MunroListFlowState>(
        key: const ValueKey('MunroListFlow'),
        state: GridState(),
        onGeneratePages: (state, pages) {
          return [
            const MaterialPage(child: RegionGridPage()),
            if (state is ListState) ...[
              MaterialPage(
                child: MunrosListPage(
                  munros: state.munros,
                  region: state.region,
                ),
              ),
            ],
          ];
        },
      ),
    );
  }
}
