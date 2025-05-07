import 'dart:io';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

@LazySingleton(as: LogOutput)
class FileLogOutput extends LogOutput {
  @override
  Future<void> output(OutputEvent event) async {
    try {
      // Write a file per log entry to the temp directory
      final tempDirectoryPath = await getTemporaryDirectory();
      final logDirectoryPath = '${tempDirectoryPath.path}/logs/';

      final filename =
          '${_generateRandomString()}-${DateTime.now().millisecondsSinceEpoch}';

      // Create the log directory if it doesn't already exist
      await Directory(logDirectoryPath).create();

      // Write the file to the logs directory
      final file = File('$logDirectoryPath/$filename.log');

      for (final line in event.lines) {
        await file.writeAsString(line);
      }

      // final str = await file.readAsString();
      // final x = 1;
    } catch (e) {
      // What do you do with an exception when logging fails? Swallow it.
    }
  }

  String _generateRandomString() {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        5, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }
}
