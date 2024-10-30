import 'package:core_munros_data/core_munros_data.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._navigation, this._munrosStatsService)
      : super(DashboardLoading());

  final IDashboardNavigation _navigation;
  final IMunrosStatsService _munrosStatsService;

  void navigateToMunroList({bool onlyShowClimbed = false}) {
    _navigation.navigateToMunroList(onlyShowClimbed: onlyShowClimbed);
  }

  void navigateToSettings() {
    _navigation.navigateToSettings();
  }

  Future<void> loadDashboardData() async {
    emit(DashboardLoading());
    final completeionPercentage =
        await _munrosStatsService.completionPercentage();
    final totalMunros = await _munrosStatsService.totalMunros();
    final totalMetersClimbed = await _munrosStatsService.totalMetersClimbed();
    final mostClimbedRegion = await _munrosStatsService.mostClimbedRegion();

    emit(
      DashboardLoaded(
        completionPercentage: completeionPercentage,
        totalMunros: totalMunros,
        totalMetersClimbed: totalMetersClimbed,
        mostClimbedRegion: mostClimbedRegion,
      ),
    );
  }
}
