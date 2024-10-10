import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:core_logging/src/presentation/cubits/logger_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final LoggerState state;
  const LoggerAppBar({required this.state, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Logs'),
      actions: state.maybeMap(
        logsExist: (e) => [
          IconButton(
            onPressed: () => showOkCancelAlertDialog(
              context: context,
              title: 'Are you sure?',
              message: 'This will delete all logs.',
            ).then(
              (result) => result == OkCancelResult.ok
                  ? context.read<LoggerCubit>().deleteLogs()
                  : null,
            ),
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () async {
              context.read<LoggerCubit>().filterLogs();
            },
            icon: e.isFiltered
                ? const Icon(Icons.filter_alt_off)
                : const Icon(Icons.filter_alt),
          ),
        ],
        orElse: () => [const SizedBox.shrink()],
      ),
    );
  }
}
