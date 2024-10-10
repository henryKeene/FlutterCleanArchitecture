import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LogDetailsPage extends StatelessWidget {
  final LogEvent log;
  const LogDetailsPage({required this.log, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                log.level.toString().replaceAll('Level.', ''),
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                log.message.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (log.error != null) ...[
                const SizedBox(height: 16),
                Text(
                  log.error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
              if (log.stackTrace != null) ...[
                const SizedBox(height: 16),
                Text(
                  log.stackTrace.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
