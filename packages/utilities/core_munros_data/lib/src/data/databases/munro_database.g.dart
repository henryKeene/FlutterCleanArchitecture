// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'munro_database.dart';

// ignore_for_file: type=lint
class $MunroTableTable extends MunroTable
    with TableInfo<$MunroTableTable, MunroTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MunroTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _regionIdMeta =
      const VerificationMeta('regionId');
  @override
  late final GeneratedColumn<int> regionId = GeneratedColumn<int>(
      'region_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _xcoordMeta = const VerificationMeta('xcoord');
  @override
  late final GeneratedColumn<int> xcoord = GeneratedColumn<int>(
      'xcoord', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ycoordMeta = const VerificationMeta('ycoord');
  @override
  late final GeneratedColumn<int> ycoord = GeneratedColumn<int>(
      'ycoord', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _climbedMeta =
      const VerificationMeta('climbed');
  @override
  late final GeneratedColumn<bool> climbed = GeneratedColumn<bool>(
      'climbed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("climbed" IN (0, 1))'));
  static const VerificationMeta _dateClimbedMeta =
      const VerificationMeta('dateClimbed');
  @override
  late final GeneratedColumn<DateTime> dateClimbed = GeneratedColumn<DateTime>(
      'date_climbed', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, regionId, height, xcoord, ycoord, climbed, dateClimbed, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'munro_table';
  @override
  VerificationContext validateIntegrity(Insertable<MunroTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('region_id')) {
      context.handle(_regionIdMeta,
          regionId.isAcceptableOrUnknown(data['region_id']!, _regionIdMeta));
    } else if (isInserting) {
      context.missing(_regionIdMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('xcoord')) {
      context.handle(_xcoordMeta,
          xcoord.isAcceptableOrUnknown(data['xcoord']!, _xcoordMeta));
    } else if (isInserting) {
      context.missing(_xcoordMeta);
    }
    if (data.containsKey('ycoord')) {
      context.handle(_ycoordMeta,
          ycoord.isAcceptableOrUnknown(data['ycoord']!, _ycoordMeta));
    } else if (isInserting) {
      context.missing(_ycoordMeta);
    }
    if (data.containsKey('climbed')) {
      context.handle(_climbedMeta,
          climbed.isAcceptableOrUnknown(data['climbed']!, _climbedMeta));
    } else if (isInserting) {
      context.missing(_climbedMeta);
    }
    if (data.containsKey('date_climbed')) {
      context.handle(
          _dateClimbedMeta,
          dateClimbed.isAcceptableOrUnknown(
              data['date_climbed']!, _dateClimbedMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MunroTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MunroTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      regionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}region_id'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height'])!,
      xcoord: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}xcoord'])!,
      ycoord: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ycoord'])!,
      climbed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}climbed'])!,
      dateClimbed: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_climbed']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $MunroTableTable createAlias(String alias) {
    return $MunroTableTable(attachedDatabase, alias);
  }
}

class MunroTableData extends DataClass implements Insertable<MunroTableData> {
  final int id;
  final String name;
  final int regionId;
  final int height;
  final int xcoord;
  final int ycoord;
  final bool climbed;
  final DateTime? dateClimbed;
  final String? notes;
  const MunroTableData(
      {required this.id,
      required this.name,
      required this.regionId,
      required this.height,
      required this.xcoord,
      required this.ycoord,
      required this.climbed,
      this.dateClimbed,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['region_id'] = Variable<int>(regionId);
    map['height'] = Variable<int>(height);
    map['xcoord'] = Variable<int>(xcoord);
    map['ycoord'] = Variable<int>(ycoord);
    map['climbed'] = Variable<bool>(climbed);
    if (!nullToAbsent || dateClimbed != null) {
      map['date_climbed'] = Variable<DateTime>(dateClimbed);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  MunroTableCompanion toCompanion(bool nullToAbsent) {
    return MunroTableCompanion(
      id: Value(id),
      name: Value(name),
      regionId: Value(regionId),
      height: Value(height),
      xcoord: Value(xcoord),
      ycoord: Value(ycoord),
      climbed: Value(climbed),
      dateClimbed: dateClimbed == null && nullToAbsent
          ? const Value.absent()
          : Value(dateClimbed),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory MunroTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MunroTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      regionId: serializer.fromJson<int>(json['regionId']),
      height: serializer.fromJson<int>(json['height']),
      xcoord: serializer.fromJson<int>(json['xcoord']),
      ycoord: serializer.fromJson<int>(json['ycoord']),
      climbed: serializer.fromJson<bool>(json['climbed']),
      dateClimbed: serializer.fromJson<DateTime?>(json['dateClimbed']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'regionId': serializer.toJson<int>(regionId),
      'height': serializer.toJson<int>(height),
      'xcoord': serializer.toJson<int>(xcoord),
      'ycoord': serializer.toJson<int>(ycoord),
      'climbed': serializer.toJson<bool>(climbed),
      'dateClimbed': serializer.toJson<DateTime?>(dateClimbed),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  MunroTableData copyWith(
          {int? id,
          String? name,
          int? regionId,
          int? height,
          int? xcoord,
          int? ycoord,
          bool? climbed,
          Value<DateTime?> dateClimbed = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      MunroTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        regionId: regionId ?? this.regionId,
        height: height ?? this.height,
        xcoord: xcoord ?? this.xcoord,
        ycoord: ycoord ?? this.ycoord,
        climbed: climbed ?? this.climbed,
        dateClimbed: dateClimbed.present ? dateClimbed.value : this.dateClimbed,
        notes: notes.present ? notes.value : this.notes,
      );
  MunroTableData copyWithCompanion(MunroTableCompanion data) {
    return MunroTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      regionId: data.regionId.present ? data.regionId.value : this.regionId,
      height: data.height.present ? data.height.value : this.height,
      xcoord: data.xcoord.present ? data.xcoord.value : this.xcoord,
      ycoord: data.ycoord.present ? data.ycoord.value : this.ycoord,
      climbed: data.climbed.present ? data.climbed.value : this.climbed,
      dateClimbed:
          data.dateClimbed.present ? data.dateClimbed.value : this.dateClimbed,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MunroTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('regionId: $regionId, ')
          ..write('height: $height, ')
          ..write('xcoord: $xcoord, ')
          ..write('ycoord: $ycoord, ')
          ..write('climbed: $climbed, ')
          ..write('dateClimbed: $dateClimbed, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, regionId, height, xcoord, ycoord, climbed, dateClimbed, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MunroTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.regionId == this.regionId &&
          other.height == this.height &&
          other.xcoord == this.xcoord &&
          other.ycoord == this.ycoord &&
          other.climbed == this.climbed &&
          other.dateClimbed == this.dateClimbed &&
          other.notes == this.notes);
}

class MunroTableCompanion extends UpdateCompanion<MunroTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> regionId;
  final Value<int> height;
  final Value<int> xcoord;
  final Value<int> ycoord;
  final Value<bool> climbed;
  final Value<DateTime?> dateClimbed;
  final Value<String?> notes;
  const MunroTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.regionId = const Value.absent(),
    this.height = const Value.absent(),
    this.xcoord = const Value.absent(),
    this.ycoord = const Value.absent(),
    this.climbed = const Value.absent(),
    this.dateClimbed = const Value.absent(),
    this.notes = const Value.absent(),
  });
  MunroTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int regionId,
    required int height,
    required int xcoord,
    required int ycoord,
    required bool climbed,
    this.dateClimbed = const Value.absent(),
    this.notes = const Value.absent(),
  })  : name = Value(name),
        regionId = Value(regionId),
        height = Value(height),
        xcoord = Value(xcoord),
        ycoord = Value(ycoord),
        climbed = Value(climbed);
  static Insertable<MunroTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? regionId,
    Expression<int>? height,
    Expression<int>? xcoord,
    Expression<int>? ycoord,
    Expression<bool>? climbed,
    Expression<DateTime>? dateClimbed,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (regionId != null) 'region_id': regionId,
      if (height != null) 'height': height,
      if (xcoord != null) 'xcoord': xcoord,
      if (ycoord != null) 'ycoord': ycoord,
      if (climbed != null) 'climbed': climbed,
      if (dateClimbed != null) 'date_climbed': dateClimbed,
      if (notes != null) 'notes': notes,
    });
  }

  MunroTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? regionId,
      Value<int>? height,
      Value<int>? xcoord,
      Value<int>? ycoord,
      Value<bool>? climbed,
      Value<DateTime?>? dateClimbed,
      Value<String?>? notes}) {
    return MunroTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      regionId: regionId ?? this.regionId,
      height: height ?? this.height,
      xcoord: xcoord ?? this.xcoord,
      ycoord: ycoord ?? this.ycoord,
      climbed: climbed ?? this.climbed,
      dateClimbed: dateClimbed ?? this.dateClimbed,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (regionId.present) {
      map['region_id'] = Variable<int>(regionId.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (xcoord.present) {
      map['xcoord'] = Variable<int>(xcoord.value);
    }
    if (ycoord.present) {
      map['ycoord'] = Variable<int>(ycoord.value);
    }
    if (climbed.present) {
      map['climbed'] = Variable<bool>(climbed.value);
    }
    if (dateClimbed.present) {
      map['date_climbed'] = Variable<DateTime>(dateClimbed.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MunroTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('regionId: $regionId, ')
          ..write('height: $height, ')
          ..write('xcoord: $xcoord, ')
          ..write('ycoord: $ycoord, ')
          ..write('climbed: $climbed, ')
          ..write('dateClimbed: $dateClimbed, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$MunroDatabase extends GeneratedDatabase {
  _$MunroDatabase(QueryExecutor e) : super(e);
  $MunroDatabaseManager get managers => $MunroDatabaseManager(this);
  late final $MunroTableTable munroTable = $MunroTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [munroTable];
}

typedef $$MunroTableTableCreateCompanionBuilder = MunroTableCompanion Function({
  Value<int> id,
  required String name,
  required int regionId,
  required int height,
  required int xcoord,
  required int ycoord,
  required bool climbed,
  Value<DateTime?> dateClimbed,
  Value<String?> notes,
});
typedef $$MunroTableTableUpdateCompanionBuilder = MunroTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> regionId,
  Value<int> height,
  Value<int> xcoord,
  Value<int> ycoord,
  Value<bool> climbed,
  Value<DateTime?> dateClimbed,
  Value<String?> notes,
});

class $$MunroTableTableTableManager extends RootTableManager<
    _$MunroDatabase,
    $MunroTableTable,
    MunroTableData,
    $$MunroTableTableFilterComposer,
    $$MunroTableTableOrderingComposer,
    $$MunroTableTableCreateCompanionBuilder,
    $$MunroTableTableUpdateCompanionBuilder> {
  $$MunroTableTableTableManager(_$MunroDatabase db, $MunroTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MunroTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MunroTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> regionId = const Value.absent(),
            Value<int> height = const Value.absent(),
            Value<int> xcoord = const Value.absent(),
            Value<int> ycoord = const Value.absent(),
            Value<bool> climbed = const Value.absent(),
            Value<DateTime?> dateClimbed = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              MunroTableCompanion(
            id: id,
            name: name,
            regionId: regionId,
            height: height,
            xcoord: xcoord,
            ycoord: ycoord,
            climbed: climbed,
            dateClimbed: dateClimbed,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int regionId,
            required int height,
            required int xcoord,
            required int ycoord,
            required bool climbed,
            Value<DateTime?> dateClimbed = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              MunroTableCompanion.insert(
            id: id,
            name: name,
            regionId: regionId,
            height: height,
            xcoord: xcoord,
            ycoord: ycoord,
            climbed: climbed,
            dateClimbed: dateClimbed,
            notes: notes,
          ),
        ));
}

class $$MunroTableTableFilterComposer
    extends FilterComposer<_$MunroDatabase, $MunroTableTable> {
  $$MunroTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get regionId => $state.composableBuilder(
      column: $state.table.regionId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get height => $state.composableBuilder(
      column: $state.table.height,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get xcoord => $state.composableBuilder(
      column: $state.table.xcoord,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get ycoord => $state.composableBuilder(
      column: $state.table.ycoord,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get climbed => $state.composableBuilder(
      column: $state.table.climbed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dateClimbed => $state.composableBuilder(
      column: $state.table.dateClimbed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MunroTableTableOrderingComposer
    extends OrderingComposer<_$MunroDatabase, $MunroTableTable> {
  $$MunroTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get regionId => $state.composableBuilder(
      column: $state.table.regionId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get height => $state.composableBuilder(
      column: $state.table.height,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get xcoord => $state.composableBuilder(
      column: $state.table.xcoord,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get ycoord => $state.composableBuilder(
      column: $state.table.ycoord,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get climbed => $state.composableBuilder(
      column: $state.table.climbed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dateClimbed => $state.composableBuilder(
      column: $state.table.dateClimbed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $MunroDatabaseManager {
  final _$MunroDatabase _db;
  $MunroDatabaseManager(this._db);
  $$MunroTableTableTableManager get munroTable =>
      $$MunroTableTableTableManager(_db, _db.munroTable);
}
