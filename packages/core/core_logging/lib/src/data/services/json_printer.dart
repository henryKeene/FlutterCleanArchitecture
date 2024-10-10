import 'dart:convert';

import 'package:core_logging/src/data/dtos/log_entry_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: LogPrinter)
class JsonPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final dto = LogEntryDto.fromLogEvent(event);

    return [jsonEncode(dto.toJson())];
  }
}
