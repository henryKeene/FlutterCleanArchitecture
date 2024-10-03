import 'package:contact/contact.dart';
import 'package:navigation/src/router.dart';

class ContactNavigation implements IContactNavigation {
  @override
  void navigateToLogging() {
    router.go('/contact/logging');
  }

  @override
  void navigateToThemeShowcase() {
    router.go('/contact/theme');
  }
}
