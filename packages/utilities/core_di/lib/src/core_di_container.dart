import 'package:core_di/src/core_di_initializer.dart';
import 'package:get_it/get_it.dart';

final diContainer = _CoreDIContainer(_getIt);

Future<DIContainer> initializeDIContainer(
  List<CoreDIInitializer> initializers,
) async {
  for (final initializer in initializers) {
    await initializer.init(_getIt);
  }
  return diContainer;
}

abstract class DIContainer {
  T call<T extends Object>({dynamic parameter, String? name});

  bool isRegistered<T extends Object>({String? name});
}

final _getIt = GetIt.instance;

class _CoreDIContainer implements DIContainer {
  const _CoreDIContainer(this._getIt);

  final GetIt _getIt;

  @override
  T call<T extends Object>({dynamic parameter, String? name}) =>
      _getIt<T>(param1: parameter, instanceName: name);

  @override
  bool isRegistered<T extends Object>({String? name}) =>
      _getIt.isRegistered<T>(instanceName: name);
}
