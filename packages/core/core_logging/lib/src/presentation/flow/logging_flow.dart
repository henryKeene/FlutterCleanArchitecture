import 'package:core_logging/logging.dart';
import 'package:core_logging/src/presentation/cubits/logger_cubit.dart';
import 'package:core_logging/src/presentation/flow/logging_flow_state.dart';
import 'package:core_logging/src/presentation/views/pages/log_details_page.dart';
import 'package:core_logging/src/presentation/views/pages/log_page.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggingFlow extends StatefulWidget {
  const LoggingFlow({super.key});

  @override
  State<LoggingFlow> createState() => _LoggingFlowState();
}

class _LoggingFlowState extends State<LoggingFlow> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  void dispose() {
    deinitialize();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoggerCubit>()..getLogs(),
      child: FlowBuilder<LoggingFlowState>(
        state: LoggingFlowLogListState(),
        onGeneratePages: (state, pages) {
          return [
            const MaterialPage(child: LogPage()),
            if (state is LoggingFlowLogDetailState)
              MaterialPage(
                child: LogDetailsPage(log: state.log),
              ),
          ];
        },
      ),
    );
  }
}
