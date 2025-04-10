import 'package:equatable/equatable.dart';

enum ForgotPasswordStatus { idle, loading, error, success }

class ForgotPasswordState extends Equatable {
  final ForgotPasswordStatus status;
  final String? error;

  const ForgotPasswordState({required this.status, required this.error});

  factory ForgotPasswordState.initial() {
    return const ForgotPasswordState(
      status: ForgotPasswordStatus.idle,
      error: null,
    );
  }

  ForgotPasswordState copyWith({ForgotPasswordStatus? status, String? error}) {
    return ForgotPasswordState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, error];
}
