import 'package:dio/dio.dart';
import 'package:store_app/core/interceptor.dart';

import '../data/models/auth_models/auth_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.11.87:8888/api/v1",
      validateStatus: (status) => true,
    ),
  )..interceptors.add(AuthInterceptor());

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {'login': login, 'password': password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw Exception("Can't login ");
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

  Future<bool> postResetEmail(String email) async {
    try {
      var response = await dio.post(
        "/auth/reset-password/email",
        data: {'email': email},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> postResetEmailCode(String email, String code) async {
    try {
      var response = await dio.post(
        "/auth/reset-password/verify",
        data: {"email": email, "code": code},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Error at reset email");
    }
  }

  Future<bool>postResetEmailCodeReset(String email, String code, String password)async{
    try{
      var response = await dio.post("/auth/reset-password/reset", data: {
        "email": email,
        "code": code,
        "password": password,

      },);
      if (response.statusCode==200) {
        return true;
      }else{
        print( "${response.statusCode} 111111111111111111111111111");
        return false;
      }
    }catch(e){
      throw Exception("Error at reset email code");
    }
  }
  Future<List<dynamic>>fetchProduct({Map<String, dynamic>? queryParams})async{
    var response = await dio.get('/products/list', queryParameters: queryParams);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    }else{
      throw Exception("/product/list error");
    }
  }
  Future<List<dynamic>>fetchCategories()async{
    var response = await dio.get('/categories/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    }else{
      print("${response.statusCode} 11111111111111111111");
      throw Exception("/products/list error");
    }
  }
  Future<List<dynamic>>fetchSavedProducts()async{
    var response = await dio.get('/products/saved-products');
    if (response.statusCode == 200) {
      return List.from(response.data);
    }else{
      print("${response.statusCode} 11111111111111111111");
      throw Exception("/products/list error");
    }
  }

  Future<bool>fetchIsLike(int id)async{
    final response = await dio.post("/auth/save/$id");
    if (response.statusCode == 200) {
      return true;
    }  else{
      return false;
    }
  }
  Future<bool>fetchUnLike(int id)async{
    final response = await dio.post("/auth/unsave/$id");
    if (response.statusCode == 200) {
      return true;
    }  else{
      return false;
    }
  }
}
