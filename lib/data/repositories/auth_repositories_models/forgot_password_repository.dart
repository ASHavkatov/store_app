import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/auth_models/fotgot_password_model.dart';

class ForgotPasswordRepository {
  final ApiClient client;

  ForgotPasswordRepository({required this.client});

  Future<bool> forgotPassword({required String email}) async {
    final result = await client.forgotPassword(
      ForgotPasswordModel(email: email),
    );
    return result;
  }
}
