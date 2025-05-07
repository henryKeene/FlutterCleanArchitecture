import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_failure.freezed.dart';

@freezed
class LogFailure {
  const factory LogFailure.failedToDeleteLogs() = FailedToDeleteLogs;
  const factory LogFailure.failedToGetLogs() = FailedToGetLogs;
}
