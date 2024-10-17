import 'package:flutter/material.dart';

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Icon(Icons.signal_wifi_off, size: 64),
          SizedBox(height: 16),
          Text(
            'You are offline',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'It appears you are offline, the app may not work properly',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
