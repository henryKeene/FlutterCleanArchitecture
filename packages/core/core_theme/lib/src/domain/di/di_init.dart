import 'package:core_theme/src/domain/di/di_init.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void initialize() {
  getIt.pushNewScope();
  $initGetIt(getIt);
}
