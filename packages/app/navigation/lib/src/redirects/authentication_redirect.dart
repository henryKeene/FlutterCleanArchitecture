import 'package:core_authentication/core_authentication.dart';
import 'package:get_it/get_it.dart';

class AuthenticationRedirect {
  IFirebaseAuthService firebaseAuthService = GetIt.I<IFirebaseAuthService>();
  String? rootRedirect() {
    if (firebaseAuthService.authStatus == AuthStatus.authenticated) {
      return null;
    } else {
      return '/login';
    }
  }

  String? loginRedirect() {
    if (firebaseAuthService.authStatus == AuthStatus.authenticated) {
      return '/';
    } else {
      return null;
    }
  }
}
