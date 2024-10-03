import 'package:contact/src/presentation/cubits/cubit/contact_cubit.dart';
import 'package:get_it/get_it.dart';

const _initializedMark = 'contact_init';

void initialize() {
  final isInitialized =
      GetIt.I.isRegistered<bool>(instanceName: _initializedMark);
  if (!isInitialized) {
    GetIt.I.registerSingleton<bool>(true, instanceName: _initializedMark);
    GetIt.I.registerFactory(() => ContactCubit(GetIt.I()));
  }
}
