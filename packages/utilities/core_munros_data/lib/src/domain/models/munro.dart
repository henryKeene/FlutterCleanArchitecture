import 'package:core_munros_data/src/domain/enums/region_enum.dart';

class Munro {
  Munro(
    this.id, {
    required this.name,
    required this.regionEnum,
    required this.height,
    required this.xcoord,
    required this.ycoord,
    required this.climbed,
    this.dateClimbed,
  });

  final int id;
  final String name;
  final RegionEnum regionEnum;
  final int height;
  final int xcoord;
  final int ycoord;
  final bool climbed;
  final DateTime? dateClimbed;
}
