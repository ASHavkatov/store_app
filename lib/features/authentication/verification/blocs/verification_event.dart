sealed class VerificationEvent {}


class VerificationCodeEvent extends VerificationEvent {
  final String code;
  VerificationCodeEvent({required this.code});
}
class VerificationEmailEvent extends VerificationEvent {
  final String email;
  VerificationEmailEvent({required this.email});
}
class VerificationPasswordEvent extends VerificationEvent {
  final String password;
  VerificationPasswordEvent({required this.password});
}