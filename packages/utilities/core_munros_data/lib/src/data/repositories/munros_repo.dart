import 'package:core_munros_data/core_munros_data.dart';
import 'package:core_munros_data/src/data/databases/munro_database.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@injectable
class MunrosRepo {
  MunrosRepo(this._munroDatabase);

  final MunroDatabase _munroDatabase;

  Future<List<Munro>> getMunros() async {
    final munroTableData = await _munroDatabase.managers.munroTable.get();

    return munroTableData
        .map(
          (e) => Munro(
            e.id,
            name: e.name,
            regionEnum: e.regionId.toRegionEnum(),
            height: e.height,
            xcoord: e.xcoord,
            ycoord: e.ycoord,
            climbed: e.climbed,
            dateClimbed: e.dateClimbed,
          ),
        )
        .toList();
  }

  Future<List<Munro>> getMunrosByRegion(int regionId) async {
    final munroTableData = await _munroDatabase.managers.munroTable
        .filter((table) => table.regionId.equals(regionId))
        .get();

    return munroTableData
        .map(
          (e) => Munro(
            e.id,
            name: e.name,
            regionEnum: e.regionId.toRegionEnum(),
            height: e.height,
            xcoord: e.xcoord,
            ycoord: e.ycoord,
            climbed: e.climbed,
            dateClimbed: e.dateClimbed,
          ),
        )
        .toList();
  }

  Future<List<Munro>> getClimbedMunros() async {
    final munroTableData = await _munroDatabase.managers.munroTable
        .filter((table) => table.climbed.equals(true))
        .get();

    return munroTableData
        .map(
          (e) => Munro(
            e.id,
            name: e.name,
            regionEnum: e.regionId.toRegionEnum(),
            height: e.height,
            xcoord: e.xcoord,
            ycoord: e.ycoord,
            climbed: e.climbed,
            dateClimbed: e.dateClimbed,
          ),
        )
        .toList();
  }

  Future<void> setMunroToClimbed(
    Munro munro, {
    required DateTime dateClimbed,
    String? notes,
  }) async {
    await _munroDatabase.managers.munroTable
        .filter((table) => table.id.equals(munro.id))
        .update(
          (table) => table(
            climbed: const Value(true),
            notes: Value(notes),
            dateClimbed: Value(dateClimbed),
          ),
        );
  }
}
