import 'package:dio/dio.dart';
import 'package:store_app/data/models/auth_models/fotgot_password_model.dart';
import 'package:store_app/data/repositories/auth_repositories_models/forgot_password_repository.dart';

import '../data/models/auth_models/auth_model.dart';

class ApiClient {

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://0.0.0.0:8888/api/v1",
        validateStatus: (status) => true,
      ),
    );
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: "http://10.10.0.229:8888/api/v1",
      validateStatus: (status) => true,
    ),
  );
  Future<String> login(String login, String password) async {
    var response = await dio.post('/auth/login', data: {'login': login, 'password': password});
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("Login qilib beomdi, xullasi nimadur no'to'g'ri ketgan");
    }
  }

  Future<bool> signUp(AuthModel model) async {
    var response = await dio.post('/auth/register', data: model.toJson());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> forgotPassword(ForgotPasswordModel model) async{
    var response = await dio.post('/auth/reset-password/email', data: model.toJson());
    if (response.data == 200) {
      return true;
    }
    return false;
  }
}
