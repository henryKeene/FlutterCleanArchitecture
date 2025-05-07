import 'package:flutter/material.dart';

class LogsListHeaderRow extends StatelessWidget {
  final BoxConstraints constraints;
  const LogsListHeaderRow({
    required this.constraints,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            'Level',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            'Time',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            width: 50,
          ),
          Text(
            'Message',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
