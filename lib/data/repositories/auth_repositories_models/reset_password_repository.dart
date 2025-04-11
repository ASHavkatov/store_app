import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/auth_models/reset_password_model.dart';

class ResetPasswordRepository {
  final ApiClient client;

  ResetPasswordRepository({required this.client});

  Future<bool> resetPassword({required String email, required String password, required String code}) async {
    final result = await client.resetPassword(
      ResetPasswordModel(email: email, password: password, code: code),
    );
    return result;
  }
}
