import 'package:app_logging/logging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomNavigationObserver extends NavigatorObserver {
  ILoggerService logger = GetIt.I<ILoggerService>();
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    logger.information('didPop: ${route.settings.name}');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    logger.information('didPush: ${route.settings.name}');
  }
}
