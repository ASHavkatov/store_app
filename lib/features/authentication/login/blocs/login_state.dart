import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';
enum LoginStatus { idle, loading, error, success }

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({required LoginStatus? status}) = _LoginState;

  factory LoginState.initial() {
    return LoginState(status: LoginStatus.loading);
  }
}