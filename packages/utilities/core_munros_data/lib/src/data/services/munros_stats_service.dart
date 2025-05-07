import 'package:core_munros_data/src/data/repositories/munros_repo.dart';
import 'package:core_munros_data/src/domain/enums/region_enum.dart';
import 'package:core_munros_data/src/domain/interfaces/i_munros_stats_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMunrosStatsService)
class MunrosStatsService implements IMunrosStatsService {
  MunrosStatsService(this._munrosRepo);

  final MunrosRepo _munrosRepo;

  @override
  Future<int> completionPercentage() async {
    final munros = await _munrosRepo.getMunros();
    final climbedMunros = munros.where((munro) => munro.climbed).length;
    final totalMunros = munros.length;

    return (climbedMunros / totalMunros * 100).round();
  }

  @override
  Future<RegionEnum> mostClimbedRegion() async {
    final munros = await _munrosRepo.getClimbedMunros();
    final regionCounts = <RegionEnum, int>{};

    for (final munro in munros) {
      if (regionCounts.containsKey(munro.regionEnum)) {
        regionCounts[munro.regionEnum] = regionCounts[munro.regionEnum]! + 1;
      } else {
        regionCounts[munro.regionEnum] = 1;
      }
    }

    if (regionCounts.isEmpty) {
      return RegionEnum.coigachToCapeWrath;
    }

    final mostClimbedRegion =
        regionCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    return mostClimbedRegion;
  }

  @override
  Future<int> totalMetersClimbed() async {
    final munros = await _munrosRepo.getClimbedMunros();
    final totalMetersClimbed = munros.fold<int>(
      0,
      (previousValue, munro) => previousValue + munro.height,
    );

    return totalMetersClimbed;
  }

  @override
  Future<int> totalMunros() {
    return _munrosRepo.getClimbedMunros().then((munros) => munros.length);
  }
}
