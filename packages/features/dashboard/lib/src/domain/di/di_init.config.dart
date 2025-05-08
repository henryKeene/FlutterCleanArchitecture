// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_munros_data/core_munros_data.dart' as _i187;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../dashboard.dart' as _i818;
import '../../presentation/cubits/dashboard_cubit/dashboard_cubit.dart'
    as _i959;
import '../../presentation/cubits/search_cubit/search_cubit.dart' as _i557;

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
  gh.factory<_i959.DashboardCubit>(() => _i959.DashboardCubit(
        gh<_i818.IDashboardNavigation>(),
        gh<_i187.IMunrosStatsService>(),
      ));
  gh.factory<_i557.SearchCubit>(
      () => _i557.SearchCubit(gh<_i187.IMunrosService>()));
  return getIt;
}
