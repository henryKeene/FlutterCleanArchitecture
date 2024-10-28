import 'package:dashboard/dashboard.dart';
import 'package:navigation/src/router.dart';

class DashboardNavigation implements IDashboardNavigation {
  @override
  void navigateToMunroList({bool onlyShowClimbed = false}) {
    router.go('/home/munro_list', extra: onlyShowClimbed);
  }
}
