import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.unexpected() = Unexpected;
  const factory AuthFailure.invalidEmail() = InvalidEmail;
}
