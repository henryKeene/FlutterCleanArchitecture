import 'package:core_logging/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'logger_cubit.freezed.dart';
part 'logger_state.dart';

@injectable
class LoggerCubit extends Cubit<LoggerState> {
  final ILoggerService _loggerService;
  bool isFiltered = false;
  List<LogEvent> _allLogs = [];

  LoggerCubit(this._loggerService) : super(const LoggerState.loading());

  void deleteLogs() {
    emit(const LoggerState.loading());
    _loggerService.deleteLogs().run().then(
      (deleteResult) {
        emit(
          deleteResult.fold(
            (_) => const LoggerState.failure(),
            (_) => const LoggerState.noLogsExist(),
          ),
        );
      },
    );
  }

  void filterLogs() {
    emit(
      state.maybeMap(
        logsExist: (state) {
          isFiltered = !isFiltered;
          return state.copyWith(
            isFiltered: isFiltered,
            logs: isFiltered
                ? state.logs
                    .where((element) => element.level == Level.error)
                    .toList()
                : _allLogs,
          );
        },
        orElse: () => const LoggerState.noLogsExist(),
      ),
    );
  }

  void getLogs() {
    emit(const LoggerState.loading());

    _loggerService.getLogs().run().then(
          (logsResult) => emit(
            logsResult.fold(
              (_) => const LoggerState.failure(),
              (logs) {
                _allLogs = logs;
                return logs.isEmpty
                    ? const LoggerState.noLogsExist()
                    : LoggerState.logsExist(
                        logs,
                        isFiltered: isFiltered,
                      );
              },
            ),
          ),
        );
  }
}
