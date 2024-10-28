import '../enums/region_enum.dart';

extension MunrosIntExtensions on int {
  RegionEnum toRegionEnum() {
    return RegionEnum.values.firstWhere((e) => e.regionId == this);
  }
}
