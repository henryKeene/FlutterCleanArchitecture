import 'package:navigation/src/router.dart';
import 'package:offline/offline.dart';

class OfflineNavigation implements IOfflineNavigation {
  @override
  Future<void> navigateToOfflineSheet() async {
    if (router.routerDelegate.currentConfiguration.last.matchedLocation
        .contains('offline')) {
      return;
    }

    await router.push('/offline');
  }

  @override
  Future<void> closeOfflineSheet() async {
    if (router.routerDelegate.currentConfiguration.last.matchedLocation
            .contains('offline') &&
        router.canPop()) {
      router.pop();
    }
  }
}
