import 'package:equatable/equatable.dart';

enum ResetPasswordStatus { idle, error, loading, success }

class ResetPasswordState extends Equatable {
  final ResetPasswordStatus status;
  final String? error;

  const ResetPasswordState({required this.status, required this.error});

  factory ResetPasswordState.initinal() {
    return const ResetPasswordState(
      status: ResetPasswordStatus.idle,
      error: null,
    );
  }

  ResetPasswordState copyWith({ResetPasswordStatus? status, String? error}) {
    return ResetPasswordState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, error];
}
