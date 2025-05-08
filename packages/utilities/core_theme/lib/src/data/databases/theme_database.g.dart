// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_database.dart';

// ignore_for_file: type=lint
class $ThemeTableTable extends ThemeTable
    with TableInfo<$ThemeTableTable, ThemeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ThemeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isSelectedMeta =
      const VerificationMeta('isSelected');
  @override
  late final GeneratedColumn<bool> isSelected = GeneratedColumn<bool>(
      'is_selected', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_selected" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, isSelected];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'theme_table';
  @override
  VerificationContext validateIntegrity(Insertable<ThemeTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_selected')) {
      context.handle(
          _isSelectedMeta,
          isSelected.isAcceptableOrUnknown(
              data['is_selected']!, _isSelectedMeta));
    } else if (isInserting) {
      context.missing(_isSelectedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ThemeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ThemeTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isSelected: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_selected'])!,
    );
  }

  @override
  $ThemeTableTable createAlias(String alias) {
    return $ThemeTableTable(attachedDatabase, alias);
  }
}

class ThemeTableData extends DataClass implements Insertable<ThemeTableData> {
  final int id;
  final bool isSelected;
  const ThemeTableData({required this.id, required this.isSelected});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_selected'] = Variable<bool>(isSelected);
    return map;
  }

  ThemeTableCompanion toCompanion(bool nullToAbsent) {
    return ThemeTableCompanion(
      id: Value(id),
      isSelected: Value(isSelected),
    );
  }

  factory ThemeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ThemeTableData(
      id: serializer.fromJson<int>(json['id']),
      isSelected: serializer.fromJson<bool>(json['isSelected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isSelected': serializer.toJson<bool>(isSelected),
    };
  }

  ThemeTableData copyWith({int? id, bool? isSelected}) => ThemeTableData(
        id: id ?? this.id,
        isSelected: isSelected ?? this.isSelected,
      );
  ThemeTableData copyWithCompanion(ThemeTableCompanion data) {
    return ThemeTableData(
      id: data.id.present ? data.id.value : this.id,
      isSelected:
          data.isSelected.present ? data.isSelected.value : this.isSelected,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ThemeTableData(')
          ..write('id: $id, ')
          ..write('isSelected: $isSelected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isSelected);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemeTableData &&
          other.id == this.id &&
          other.isSelected == this.isSelected);
}

class ThemeTableCompanion extends UpdateCompanion<ThemeTableData> {
  final Value<int> id;
  final Value<bool> isSelected;
  const ThemeTableCompanion({
    this.id = const Value.absent(),
    this.isSelected = const Value.absent(),
  });
  ThemeTableCompanion.insert({
    this.id = const Value.absent(),
    required bool isSelected,
  }) : isSelected = Value(isSelected);
  static Insertable<ThemeTableData> custom({
    Expression<int>? id,
    Expression<bool>? isSelected,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isSelected != null) 'is_selected': isSelected,
    });
  }

  ThemeTableCompanion copyWith({Value<int>? id, Value<bool>? isSelected}) {
    return ThemeTableCompanion(
      id: id ?? this.id,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isSelected.present) {
      map['is_selected'] = Variable<bool>(isSelected.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ThemeTableCompanion(')
          ..write('id: $id, ')
          ..write('isSelected: $isSelected')
          ..write(')'))
        .toString();
  }
}

abstract class _$ThemeDatabase extends GeneratedDatabase {
  _$ThemeDatabase(QueryExecutor e) : super(e);
  $ThemeDatabaseManager get managers => $ThemeDatabaseManager(this);
  late final $ThemeTableTable themeTable = $ThemeTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [themeTable];
}

typedef $$ThemeTableTableCreateCompanionBuilder = ThemeTableCompanion Function({
  Value<int> id,
  required bool isSelected,
});
typedef $$ThemeTableTableUpdateCompanionBuilder = ThemeTableCompanion Function({
  Value<int> id,
  Value<bool> isSelected,
});

class $$ThemeTableTableFilterComposer
    extends Composer<_$ThemeDatabase, $ThemeTableTable> {
  $$ThemeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSelected => $composableBuilder(
      column: $table.isSelected, builder: (column) => ColumnFilters(column));
}

class $$ThemeTableTableOrderingComposer
    extends Composer<_$ThemeDatabase, $ThemeTableTable> {
  $$ThemeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSelected => $composableBuilder(
      column: $table.isSelected, builder: (column) => ColumnOrderings(column));
}

class $$ThemeTableTableAnnotationComposer
    extends Composer<_$ThemeDatabase, $ThemeTableTable> {
  $$ThemeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isSelected => $composableBuilder(
      column: $table.isSelected, builder: (column) => column);
}

class $$ThemeTableTableTableManager extends RootTableManager<
    _$ThemeDatabase,
    $ThemeTableTable,
    ThemeTableData,
    $$ThemeTableTableFilterComposer,
    $$ThemeTableTableOrderingComposer,
    $$ThemeTableTableAnnotationComposer,
    $$ThemeTableTableCreateCompanionBuilder,
    $$ThemeTableTableUpdateCompanionBuilder,
    (
      ThemeTableData,
      BaseReferences<_$ThemeDatabase, $ThemeTableTable, ThemeTableData>
    ),
    ThemeTableData,
    PrefetchHooks Function()> {
  $$ThemeTableTableTableManager(_$ThemeDatabase db, $ThemeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ThemeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ThemeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ThemeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> isSelected = const Value.absent(),
          }) =>
              ThemeTableCompanion(
            id: id,
            isSelected: isSelected,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required bool isSelected,
          }) =>
              ThemeTableCompanion.insert(
            id: id,
            isSelected: isSelected,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ThemeTableTableProcessedTableManager = ProcessedTableManager<
    _$ThemeDatabase,
    $ThemeTableTable,
    ThemeTableData,
    $$ThemeTableTableFilterComposer,
    $$ThemeTableTableOrderingComposer,
    $$ThemeTableTableAnnotationComposer,
    $$ThemeTableTableCreateCompanionBuilder,
    $$ThemeTableTableUpdateCompanionBuilder,
    (
      ThemeTableData,
      BaseReferences<_$ThemeDatabase, $ThemeTableTable, ThemeTableData>
    ),
    ThemeTableData,
    PrefetchHooks Function()>;

class $ThemeDatabaseManager {
  final _$ThemeDatabase _db;
  $ThemeDatabaseManager(this._db);
  $$ThemeTableTableTableManager get themeTable =>
      $$ThemeTableTableTableManager(_db, _db.themeTable);
}
