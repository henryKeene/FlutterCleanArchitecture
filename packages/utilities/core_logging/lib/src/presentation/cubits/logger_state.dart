part of 'logger_cubit.dart';

@freezed
class LoggerState with _$LoggerState {
  const factory LoggerState.failure() = _Failure;
  const factory LoggerState.loading() = _Loading;
  const factory LoggerState.logsExist(
    List<LogEvent> logs, {
    required bool isFiltered,
  }) = _LogsExist;
  const factory LoggerState.noLogsExist() = _NoLogsExist;
}
