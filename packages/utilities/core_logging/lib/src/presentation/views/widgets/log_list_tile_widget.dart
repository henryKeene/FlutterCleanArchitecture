import 'package:core_logging/src/presentation/flow/logging_flow_state.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class LogListTileWidget extends StatelessWidget {
  final LogEvent log;
  const LogListTileWidget({required this.log, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      dense: true,
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              log.level.toString().replaceAll('Level.', ''),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              DateFormat('kk:mmaa\nd/M/yy').format(log.time),
              textAlign: TextAlign.end,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                log.message.toString(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
      onTap: () => context.flow<LoggingFlowState>().update(
            (state) => LoggingFlowLogDetailState(log),
          ),
    );
  }
}
