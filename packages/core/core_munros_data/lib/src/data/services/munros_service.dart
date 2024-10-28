import 'package:core_munros_data/core_munros_data.dart';
import 'package:core_munros_data/src/data/repositories/munros_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMunrosService)
class MunrosService implements IMunrosService {
  MunrosService(this._munrosRepo);

  final MunrosRepo _munrosRepo;

  @override
  Future<List<Munro>> getMunros() async {
    return _munrosRepo.getMunros();
  }

  @override
  Future<List<Munro>> getMunrosByRegion(RegionEnum regionEnum) {
    return _munrosRepo.getMunrosByRegion(regionEnum.regionId);
  }

  @override
  Future<Map<RegionEnum, List<Munro>>> getAllMunrosSortedByRegion({
     bool onlyShowClimbed = false,
  }) async {
    final munrosByRegion = <RegionEnum, List<Munro>>{};
    for (final region in RegionEnum.values) {
      final munros = await _munrosRepo.getMunrosByRegion(region.regionId);

      if (onlyShowClimbed) {
        munros.removeWhere((munro) => !munro.climbed);
      }
      munrosByRegion[region] = munros;
    }

    return munrosByRegion;
  }

  @override
  Future<void> setMunroToClimbed(
    Munro munro, {
    required DateTime dateClimbed,
    String? notes,
  }) {
    return _munrosRepo.setMunroToClimbed(
      munro,
      dateClimbed: dateClimbed,
      notes: notes,
    );
  }
}
