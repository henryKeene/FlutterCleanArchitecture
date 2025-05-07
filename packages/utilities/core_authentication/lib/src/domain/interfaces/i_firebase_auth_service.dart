import 'package:core_authentication/core_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class IFirebaseAuthService {
  Stream<User?> get authStateChanges;

  AuthStatus get authStatus;

  TaskEither<AuthFailure, Unit> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  TaskEither<AuthFailure, Unit> signOut();

  TaskEither<AuthFailure, Unit> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
}
