import 'package:core_authentication/src/domain/enums/auth_status_enum.dart';
import 'package:core_authentication/src/domain/failures/auth_failure.dart';
import 'package:core_authentication/src/domain/interfaces/i_firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IFirebaseAuthService)
class FirebaseAuthService implements IFirebaseAuthService {
  FirebaseAuthService(this._firebaseAuth);
  final FirebaseAuth _firebaseAuth;

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  @override
  TaskEither<AuthFailure, Unit> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      TaskEither.tryCatch(
        () async => _firebaseAuth
            .signInWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then((_) => unit),
        (e, s) => const AuthFailure.unexpected(),
      );

  @override
  TaskEither<AuthFailure, Unit> signOut() => TaskEither.tryCatch(
        () async {
          return _firebaseAuth.signOut().then((value) => unit);
        },
        (e, s) {
          return const AuthFailure.unexpected();
        },
      );

  @override
  TaskEither<AuthFailure, Unit> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      TaskEither.tryCatch(
        () async => _firebaseAuth
            .createUserWithEmailAndPassword(
              email: email,
              password: password,
            )
            .then((_) => unit),
        (e, s) => const AuthFailure.unexpected(),
      );

  @override
  AuthStatus get authStatus => _firebaseAuth.currentUser == null
      ? AuthStatus.unauthenticated
      : AuthStatus.authenticated;
}
