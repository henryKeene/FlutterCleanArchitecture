import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:offline/src/domain/interfaces/i_offline_service.dart';
import 'package:offline/src/domain/navigation/i_offline_navigation.dart';

@LazySingleton(as: IOfflineService)
class OfflineService implements IOfflineService {
  OfflineService(this._offlineNavigation);

  final IOfflineNavigation _offlineNavigation;

  @override
  Future<bool> get isOnline => Connectivity().checkConnectivity().then((value) {
        return !value.contains(ConnectivityResult.none);
      });

  @override
  Stream<List<ConnectivityResult>> get connectivityStateChanged =>
      Connectivity().onConnectivityChanged.map((event) {
        if (event.contains(ConnectivityResult.none)) {
          _offlineNavigation.navigateToOfflineSheet();
        } else {
          _offlineNavigation.closeOfflineSheet();
        }
        return event;
      });
}
