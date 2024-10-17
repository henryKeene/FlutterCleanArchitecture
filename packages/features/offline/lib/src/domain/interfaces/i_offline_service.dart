import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class IOfflineService {
  Stream<List<ConnectivityResult>> get connectivityStateChanged;
  Future<bool> get isOnline;
}
