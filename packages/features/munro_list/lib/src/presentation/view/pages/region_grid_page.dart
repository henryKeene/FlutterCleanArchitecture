import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:munro_list/src/presentation/cubits/munros_cubit/munros_cubit.dart';
import 'package:munro_list/src/presentation/flow/munro_list_flow_state.dart';
import 'package:munro_list/src/presentation/view/widgets/regions_grid.dart';

class RegionGridPage extends StatelessWidget {
  const RegionGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.flow<MunroListFlowState>().complete(),
        ),
        title: const Text('Regions'),
      ),
      body: BlocBuilder<MunrosCubit, MunrosState>(
        builder: (context, state) {
          return switch (state) {
            MunrosLoading() => const Center(child: CircularProgressIndicator()),
            MunrosLoaded() => RegionsGrid(
                regionsAndMunros: state.munrosByRegion,
              ),
          };
        },
      ),
    );
  }
}
