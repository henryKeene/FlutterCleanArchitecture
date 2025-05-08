// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../app_theme.dart' as _i893;
import '../../data/repositories/theme_handler_repo.dart' as _i575;
import '../../data/services/theme_handler_service.dart' as _i65;
import '../../presentation/cubit/cubit/theme_cubit.dart' as _i129;
import '../interface/i_theme_handler_service.dart' as _i24;

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
  gh.lazySingleton<_i575.ThemeHandlerRepo>(() => _i575.ThemeHandlerRepo());
  gh.lazySingleton<_i893.IThemeHandlerService>(
      () => _i65.ThemeHandlerService(gh<_i575.ThemeHandlerRepo>()));
  gh.factory<_i129.ThemeCubit>(
      () => _i129.ThemeCubit(gh<_i24.IThemeHandlerService>()));
  return getIt;
}
