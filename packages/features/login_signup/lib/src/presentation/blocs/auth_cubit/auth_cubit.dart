import 'package:core_authentication/core_authentication.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._firebaseAuthService) : super(AuthState.initial());
  final IFirebaseAuthService _firebaseAuthService;

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void confirmPasswordChanged(String confirmPassword) {
    emit(state.copyWith(confirmPassword: confirmPassword));
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    final result = await _firebaseAuthService
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .run();
    return result.getLeft().fold(
          () => null,
          (failure) => emit(
            state.copyWith(
              isLoading: false,
              failure: some(failure),
            ),
          ),
        );
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoading: true));
    final result = await _firebaseAuthService
        .signUpWithEmailAndPassword(
          email: email,
          password: password,
        )
        .run();
    return result.getLeft().fold(
          () => null,
          (failure) => emit(
            state.copyWith(
              isLoading: false,
              failure: some(failure),
            ),
          ),
        );
  }
}
