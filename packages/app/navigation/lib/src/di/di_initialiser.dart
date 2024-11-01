import 'package:contact/contact.dart';
import 'package:dashboard/dashboard.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/src/feature/contact.dart';
import 'package:navigation/src/feature/dashboard.dart';
import 'package:navigation/src/feature/offline.dart';
import 'package:offline/offline.dart';

void initialize() {
  GetIt.I.registerFactory<IContactNavigation>(
    ContactNavigation.new,
  );
  GetIt.I.registerFactory<IOfflineNavigation>(
    OfflineNavigation.new,
  );
  GetIt.I.registerFactory<IDashboardNavigation>(
    DashboardNavigation.new,
  );
}
