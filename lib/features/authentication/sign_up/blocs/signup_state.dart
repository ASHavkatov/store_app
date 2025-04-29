import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_state.freezed.dart';
enum SignUpStatus { idle, loading, error, success }
@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({required SignUpStatus? status}) = _SignUpState;
  factory SignUpState.initial() {
    return SignUpState(status: SignUpStatus.loading);
  }
}
