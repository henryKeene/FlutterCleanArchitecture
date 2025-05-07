import 'package:core_logging/src/presentation/views/widgets/log_list_header_row_widget.dart';
import 'package:core_logging/src/presentation/views/widgets/log_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LogListWidget extends StatelessWidget {
  final List<LogEvent> logs;
  const LogListWidget({required this.logs, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: ListView.builder(
            itemCount: logs.length,
            itemBuilder: (context, index) {
              final log = logs[index];
              return Column(
                children: [
                  if (index == 0) ...[
                    LogsListHeaderRow(
                      constraints: constraints,
                    ),
                    const Divider(
                      height: 6,
                      thickness: 1,
                    ),
                  ],
                  LogListTileWidget(
                    log: log,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
