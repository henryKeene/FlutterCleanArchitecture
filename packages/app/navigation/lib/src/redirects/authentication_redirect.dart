import 'package:core_authentication/core_authentication.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AuthenticationRedirect {
  IFirebaseAuthService firebaseAuthService = GetIt.I<IFirebaseAuthService>();
  String? rootRedirect(BuildContext context, GoRouterState state) {
    if (firebaseAuthService.authStatus == AuthStatus.authenticated &&
        !state.fullPath!.contains('login')) {
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
