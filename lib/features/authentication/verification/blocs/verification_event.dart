sealed class VerificationEvent {}


class VerificationCodeEvent extends VerificationEvent {
  final String code;
  final String email;
  VerificationCodeEvent({required this.code, required this.email});
}
class VerificationEmailEvent extends VerificationEvent {
  final String email;
  VerificationEmailEvent({required this.email});
}
class VerificationPasswordEvent extends VerificationEvent {
  final String password;
  final String email;
  final String code;
  VerificationPasswordEvent({required this.email,
    required this.password,
    required this.code,});
}