import 'dart:async';
import 'package:get_it/get_it.dart';

typedef GetItInitializer = FutureOr<void> Function(
  GetIt getIt,
  String? environment,
);

class CoreDIInitializer {
  const CoreDIInitializer(this._initializer);

  final GetItInitializer _initializer;

  FutureOr<void> init(GetIt getIt) => _initializer(getIt, null);
}
