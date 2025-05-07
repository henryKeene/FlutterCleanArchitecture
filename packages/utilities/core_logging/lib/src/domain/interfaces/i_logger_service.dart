import 'package:core_logging/src/domain/failures/log_failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';

abstract interface class ILoggerService {
  /// Log a debug message
  Unit debug(String message);

  // Delete all log events from the device
  TaskEither<LogFailure, Unit> deleteLogs();

  /// Log an error message with optional exception and stack trace. Also sends to crashlytics.
  Unit error(
    String message, [
    dynamic exception,
    StackTrace stackTrace,
  ]);

  /// Read the log events
  TaskEither<LogFailure, List<LogEvent>> getLogs();

  /// Log an information message
  Unit information(String message);
}
