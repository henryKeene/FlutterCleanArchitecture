import 'package:core_authentication/core_authentication.dart';
import 'package:core_theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._firebaseAuthService, this._themeHandlerService)
      : super(SettingsInitial());

  final IFirebaseAuthService _firebaseAuthService;
  final IThemeHandlerService _themeHandlerService;

  void toggleTheme() {
    _themeHandlerService.toggleTheme();
  }

  void signOut() {
    _firebaseAuthService.signOut().run();
  }
}
