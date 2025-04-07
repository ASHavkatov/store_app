import 'package:equatable/equatable.dart';

enum LoginStatus { idle, loading, error, success }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? error;

  const LoginState({
    required this.status,
    this.error,
  });

  factory LoginState.initial() {
    return const LoginState(
      status: LoginStatus.idle,
      error: null,
    );
  }

  LoginState copyWith({
    LoginStatus? status,
    String? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, error];
}
