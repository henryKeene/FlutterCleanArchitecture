import 'package:core_logging/src/presentation/cubits/logger_cubit.dart';
import 'package:core_logging/src/presentation/views/widgets/inline_message_widget.dart';
import 'package:core_logging/src/presentation/views/widgets/log_list_widget.dart';
import 'package:core_logging/src/presentation/views/widgets/log_loading_widget.dart';
import 'package:core_logging/src/presentation/views/widgets/logger_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoggerCubit, LoggerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: LoggerAppBar(state: state),
          body: state.map(
            failure: (_) => const InlineMessageWidget(
              icon: Icons.error,
              message: 'Something has gone wrong loading the logs!',
            ),
            loading: (_) => const LogLoadingWidget(),
            logsExist: (state) => LogListWidget(logs: state.logs),
            noLogsExist: (_) => const InlineMessageWidget(
              icon: Icons.info,
              message: 'No logs exist.',
            ),
          ),
        );
      },
    );
  }
}
