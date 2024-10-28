import 'package:core_munros_data/core_munros_data.dart';

abstract interface class IMunrosService {
  Future<List<Munro>> getMunros();

  Future<List<Munro>> getMunrosByRegion(RegionEnum regionEnum);

  Future<Map<RegionEnum, List<Munro>>> getAllMunrosSortedByRegion({
    bool onlyShowClimbed = false,
  });

  Future<void> setMunroToClimbed(
    Munro munro, {
    required DateTime dateClimbed,
    String? notes,
  });
}
