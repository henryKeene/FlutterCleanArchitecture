import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

part 'munro_database.g.dart';

class MunroTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get regionId => integer()();
  IntColumn get height => integer()();
  IntColumn get xcoord => integer()();
  IntColumn get ycoord => integer()();
  BoolColumn get climbed => boolean()();
  DateTimeColumn get dateClimbed => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
}

@LazySingleton()
@DriftDatabase(tables: [MunroTable])
class MunroDatabase extends _$MunroDatabase {
  MunroDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'munro_database');
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _insertMunrosFromCsv();
        },
      );
  Future<void> _insertMunrosFromCsv() async {
    try {
      final csvData = await rootBundle.loadString(
        'packages/core_munros_data/assets/csv/munros_simple_2.csv',
      );
      final rowsAsListOfValues = const CsvToListConverter().convert(csvData);

      for (final row in rowsAsListOfValues.skip(1)) {
        await into(munroTable).insert(
          MunroTableCompanion.insert(
            name: row[0] as String,
            regionId: row[1] as int,
            height: row[2] as int,
            xcoord: row[3] as int,
            ycoord: row[4] as int,
            climbed: false,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting munros: $e');
      }
    }
  }
}
