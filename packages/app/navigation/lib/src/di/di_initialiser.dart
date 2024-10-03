import 'package:contact/contact.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/src/feature/contact.dart';

void initialize() {
  GetIt.I.registerFactory<IContactNavigation>(
    ContactNavigation.new,
  );
}
