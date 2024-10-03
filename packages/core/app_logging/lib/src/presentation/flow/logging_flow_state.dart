import 'package:logger/logger.dart';

sealed class LoggingFlowState {}

class LoggingFlowLogListState extends LoggingFlowState {
  LoggingFlowLogListState();
}

class LoggingFlowLogDetailState extends LoggingFlowState {
  LoggingFlowLogDetailState(this.log);

  final LogEvent log;
}
