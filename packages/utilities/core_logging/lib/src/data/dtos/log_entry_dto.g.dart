// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogEntryDto _$LogEntryDtoFromJson(Map<String, dynamic> json) => LogEntryDto(
      $enumDecode(_$LogLevelEnumEnumMap, json['level']),
      json['message'] as String,
      json['error'] as String?,
      json['stackTrace'] as String?,
      json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$LogEntryDtoToJson(LogEntryDto instance) =>
    <String, dynamic>{
      'level': _$LogLevelEnumEnumMap[instance.level]!,
      'message': instance.message,
      'error': instance.error,
      'stackTrace': instance.stackTrace,
      'time': instance.time?.toIso8601String(),
    };

const _$LogLevelEnumEnumMap = {
  LogLevelEnum.verbose: 'verbose',
  LogLevelEnum.debug: 'debug',
  LogLevelEnum.info: 'info',
  LogLevelEnum.warning: 'warning',
  LogLevelEnum.error: 'error',
  LogLevelEnum.wtf: 'wtf',
  LogLevelEnum.nothing: 'nothing',
};
