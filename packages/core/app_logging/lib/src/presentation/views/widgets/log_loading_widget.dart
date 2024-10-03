import 'package:flutter/material.dart';

class LogLoadingWidget extends StatelessWidget {
  const LogLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
