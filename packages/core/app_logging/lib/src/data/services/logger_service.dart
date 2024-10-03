import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:app_logging/src/data/dtos/log_entry_dto.dart';
import 'package:app_logging/src/domain/failures/log_failure.dart';
import 'package:app_logging/src/domain/interfaces/i_logger_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class AlwaysLogFilter extends LogFilter {
  // See https://stackoverflow.com/a/69800377/15904
  // In release mode all logs are omitted, so this is required to force them
  // in all versions of the app
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

@LazySingleton(as: ILoggerService)
class LoggerService implements ILoggerService {
  final LogPrinter _printer;
  final LogOutput _output;
  late Logger _logger;

  LoggerService(this._printer, this._output) {
    _logger = Logger(
      filter: AlwaysLogFilter(),
      printer: _printer,
      output: _output,
    );
  }

  @override
  Unit debug(String message) {
    _logger.d(message);
    return unit;
  }

  @override
  TaskEither<LogFailure, Unit> deleteLogs() => TaskEither.tryCatch(
        () => _getLogDirectoryPath()
            .run()
            .then(
              (logDirectoryPath) => Directory(logDirectoryPath).listSync(
                followLinks: false,
              ),
            )
            .then(
              (files) => Future.wait(
                files.map(
                  (file) => File(file.path).delete(),
                ),
              ),
            )
            .then(
              (_) => unit,
            ),
        (error, stackTrace) => const LogFailure.failedToDeleteLogs(),
      );

  @override
  Unit error(
    String message, [
    dynamic exception,
    StackTrace? stackTrace,
  ]) {
    _logger.e(
      message,
      error: exception,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );

    return unit;
  }

  @override
  TaskEither<LogFailure, List<LogEvent>> getLogs() => TaskEither.tryCatch(
        () => _getLogDirectoryPath()
            .run()
            // Create the log directory if it doesn't already exist
            //(in case we're reading before any logs are created)
            .then(
              (logDirectoryPath) => Directory(logDirectoryPath).create().then(
                    (_) => Directory(logDirectoryPath).listSync(
                      followLinks: false,
                    ),
                  ),
            )
            .then(
              _getAndParseLogEntrys,
            ),
        (error, stackTrace) {
          deleteLogs().run();
          return const LogFailure.failedToGetLogs();
        },
      );

  @override
  Unit information(String message) {
    _logger.i(message);
    return unit;
  }

  Future<List<LogEvent>> _getAndParseLogEntrys(
    List<FileSystemEntity> files,
  ) {
    // Run this in an isolate to avoid blocking the main thread
    // stop UI jank when loading logs
    return Isolate.run(
      () async {
        final logEntries = <LogEntryDto>[];
        for (final file in files) {
          final data = await File(file.path).readAsString();
          logEntries.add(
            LogEntryDto.fromJson(json.decode(data) as Map<String, dynamic>),
          );
        }
        logEntries.sort(
          (a, b) => b.time!.compareTo(a.time!),
        );
        //// if you wanted to remove duplicate info logs then uncomment
        // final seenEntries = <String>{};
        // logEntries.retainWhere((entry) {
        //   if (entry.level == LogLevelEnum.error) {
        //     return true;
        //   }
        //   final entrySignature = '${entry.level}-${entry.message}';
        //   if (!seenEntries.contains(entrySignature)) {
        //     seenEntries.add(entrySignature);
        //     return true;
        //   }
        //   return false;
        // });

        return logEntries.map((log) => log.toDomain).toList();
      },
    );
  }

  Task<String> _getLogDirectoryPath() => Task(
        () => getTemporaryDirectory()
            .then((tempDirectoryPath) => '${tempDirectoryPath.path}/logs'),
      );
}
