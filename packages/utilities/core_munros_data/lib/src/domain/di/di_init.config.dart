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

import '../../../core_munros_data.dart' as _i567;
import '../../data/databases/munro_database.dart' as _i67;
import '../../data/repositories/munros_repo.dart' as _i756;
import '../../data/services/munros_service.dart' as _i1;
import '../../data/services/munros_stats_service.dart' as _i649;
import '../interfaces/i_munros_stats_service.dart' as _i922;

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
  gh.lazySingleton<_i67.MunroDatabase>(() => _i67.MunroDatabase());
  gh.factory<_i756.MunrosRepo>(
      () => _i756.MunrosRepo(gh<_i67.MunroDatabase>()));
  gh.lazySingleton<_i922.IMunrosStatsService>(
      () => _i649.MunrosStatsService(gh<_i756.MunrosRepo>()));
  gh.lazySingleton<_i567.IMunrosService>(
      () => _i1.MunrosService(gh<_i756.MunrosRepo>()));
  return getIt;
}
