import 'package:store_app/features/authentication/forgot_password/blocs/forgot_password_event.dart';

abstract class ResetPasswordEvent {}

class ResetPasswordSubmitted extends ResetPasswordEvent {
  final String email, password, code;

  ResetPasswordSubmitted({
    required this.email,
    required this.password,
    required this.code,
  });
}
