part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required GlobalKey<FormState> formKey,
    required bool isLoading,
    required Option<AuthFailure> failure,
    required String email,
    required String password,
    required String confirmPassword,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        formKey: GlobalKey<FormState>(),
        isLoading: false,
        failure: none(),
        email: '',
        password: '',
        confirmPassword: '',
      );
}
