import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'theme_database.g.dart';

class ThemeTable extends Table {
  IntColumn get id => integer()();
  BoolColumn get isSelected => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [ThemeTable])
class ThemeDatabase extends _$ThemeDatabase {
  ThemeDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'theme_database');
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();

          await into(themeTable).insert(
            ThemeTableCompanion.insert(id: const Value(1), isSelected: true),
          );

          await into(themeTable).insert(
            ThemeTableCompanion.insert(id: const Value(2), isSelected: false),
          );
        },
      );
}
