import 'package:core_authentication/core_authentication.dart' as auth;
import 'package:core_logging/logging.dart' as logging;
import 'package:navigation/navigation.dart' as navigation;

void initialize() {
  auth.initialize();
  navigation.initialize();
  logging.initialize();
}
