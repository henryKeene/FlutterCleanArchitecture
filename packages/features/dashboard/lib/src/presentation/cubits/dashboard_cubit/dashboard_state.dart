part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardLoaded extends DashboardState {
  DashboardLoaded({
    required this.completionPercentage,
    required this.totalMunros,
    required this.totalMetersClimbed,
    required this.mostClimbedRegion,
  });

  final int completionPercentage;
  final int totalMunros;
  final int totalMetersClimbed;
  final RegionEnum mostClimbedRegion;
}
