
abstract class ResetPasswordEvent {}

class ResetPasswordSubmitted extends ResetPasswordEvent {
  final String email, password, code;

  ResetPasswordSubmitted({
    required this.email,
    required this.password,
    required this.code,
  });
}
