import 'package:core_munros_data/core_munros_data.dart';

abstract interface class IMunrosStatsService {
  Future<int> completionPercentage();
  Future<int> totalMunros();
  Future<int> totalMetersClimbed();
  Future<RegionEnum> mostClimbedRegion();
}
