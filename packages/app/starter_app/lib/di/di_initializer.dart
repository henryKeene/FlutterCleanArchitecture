import 'package:core_authentication/core_authentication.dart' as auth;
import 'package:core_logging/logging.dart' as logging;
import 'package:core_munros_data/core_munros_data.dart' as core_munros_data;
import 'package:core_theme/app_theme.dart' as theme;
import 'package:get_it/get_it.dart';
import 'package:lego_architecture_demo_mason/app/view/cubits/cubit/theme_handler_cubit.dart';
import 'package:navigation/navigation.dart' as navigation;
import 'package:offline/offline.dart' as offline;

void initialize() {
  theme.initialize();
  GetIt.I
      .registerFactory<ThemeHandlerCubit>(() => ThemeHandlerCubit(GetIt.I()));
  auth.initialize();
  navigation.initialize();
  logging.initialize();
  offline.initialize();
  core_munros_data.initialize();
}
