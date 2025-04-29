import 'package:freezed_annotation/freezed_annotation.dart';
part 'verification_state.freezed.dart';

enum VerificationStatus { idle, loading, error, success }

@freezed
abstract class VerificationState with _$VerificationState {
  const factory VerificationState({
    required VerificationStatus status,
    required String? message,
  }) = _VerificationState;

  factory VerificationState.initial() {
    return VerificationState(message: null, status: VerificationStatus.loading);
  }
}
