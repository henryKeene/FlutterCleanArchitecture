import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:offline/offline.dart';
import 'package:offline/src/domain/constants/offline_config_constants.dart';
import 'package:offline/src/domain/di/di_init.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> initialize() async {
  await Future<void>.delayed(OfflineConfigConstants.delayOfflineCheck);
  getIt.pushNewScope();
  $initGetIt(getIt);

  final offlineService = getIt<IOfflineService>();

  offlineService.connectivityStateChanged.listen((event) {});
}
