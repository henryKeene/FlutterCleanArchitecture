// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_authentication/core_authentication.dart' as _i643;
import 'package:core_theme/app_theme.dart' as _i1054;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../presentation/cubit/cubit/settings_cubit.dart' as _i366;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i366.SettingsCubit>(() => _i366.SettingsCubit(
        gh<_i643.IFirebaseAuthService>(),
        gh<_i1054.IThemeHandlerService>(),
      ));
  return getIt;
}
