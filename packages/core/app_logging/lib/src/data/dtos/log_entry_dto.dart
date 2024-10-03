import 'package:app_logging/src/domain/enums/log_level_enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';

part 'log_entry_dto.g.dart';

@JsonSerializable()
class LogEntryDto {
  LogEntryDto(
    this.level,
    this.message,
    this.error,
    this.stackTrace,
    this.time,
  );

  final LogLevelEnum level;
  final String message;
  final String? error;
  final String? stackTrace;
  final DateTime? time;

  factory LogEntryDto.fromJson(Map<String, dynamic> json) =>
      _$LogEntryDtoFromJson(json);

  factory LogEntryDto.fromLogEvent(LogEvent event) {
    return LogEntryDto(
      _convertToLogLevelEnum(event.level),
      event.message.toString(),
      event.error?.toString(),
      event.stackTrace?.toString().replaceAll(r'\', r'\\'),
      event.time,
    );
  }

  LogEvent get toDomain => LogEvent(
        _convertToLevel(level),
        message,
        error: error,
        stackTrace:
            stackTrace != null ? StackTrace.fromString(stackTrace!) : null,
        time: time,
      );

  Map<String, dynamic> toJson() => _$LogEntryDtoToJson(this);

  static Level _convertToLevel(LogLevelEnum level) {
    switch (level) {
      case LogLevelEnum.debug:
        return Level.debug;
      case LogLevelEnum.info:
        return Level.info;
      case LogLevelEnum.warning:
        return Level.warning;
      case LogLevelEnum.error:
        return Level.error;
      default:
        return Level.debug;
    }
  }

  static LogLevelEnum _convertToLogLevelEnum(Level level) {
    switch (level) {
      case Level.debug:
        return LogLevelEnum.debug;
      case Level.info:
        return LogLevelEnum.info;
      case Level.warning:
        return LogLevelEnum.warning;
      case Level.error:
        return LogLevelEnum.error;
      default:
        return LogLevelEnum.nothing;
    }
  }
}
