// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../presentation/cubits/logger_cubit.dart' as _i685;
import '../interfaces/i_logger_service.dart' as _i108;
import '../../data/services/file_log_output.dart' as _i928;
import '../../data/services/json_printer.dart' as _i1041;
import '../../data/services/logger_service.dart' as _i482;

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
  gh.lazySingleton<_i974.LogPrinter>(() => _i1041.JsonPrinter());
  gh.lazySingleton<_i974.LogOutput>(() => _i928.FileLogOutput());
  gh.lazySingleton<_i108.ILoggerService>(() => _i482.LoggerService(
        gh<_i974.LogPrinter>(),
        gh<_i974.LogOutput>(),
      ));
  gh.factory<_i685.LoggerCubit>(
      () => _i685.LoggerCubit(gh<_i108.ILoggerService>()));
  return getIt;
}
