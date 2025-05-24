import 'package:dio/dio.dart';
import 'package:store_app/core/interceptor.dart';

import '../data/models/auth_models/auth_model.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(

      baseUrl: "http://192.168.10.67:8888/api/v1",
      validateStatus: (status) => true,

      baseUrl: "http://0.0.0.0:8888/api/v1",

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

  Future<bool> postNewCard(
    String cardNumber,
    String expiryDate,
    String securityCode,
  ) async {
    try {
      var response = await dio.post(
        "/cards/create",
        data: {
          "cardNumber": cardNumber,
          "expiryDate": expiryDate,
          "securityCode": securityCode,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("New card yaratishda hatolik bor $e");
    }
  }
  Future<List<dynamic>> fetchCard() async {
    var response = await dio.get("/cards/list");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return throw Exception("Card ni olib kelishda hatolik bor");
    }
  }
  Future<bool> postResetEmailCodeReset(
    String email,
    String code,
    String password,
  ) async {
    try {
      var response = await dio.post(
        "/auth/reset-password/reset",
        data: {"email": email, "code": code, "password": password},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Error at reset email code");
    }
  }



  Future<List<dynamic>> fetchNotification() async {
    var response = await dio.get("/notifications/list");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("Notification ni olib kelishda hatolik bor");
    }
  }

  Future<dynamic> fetchDetail(int id) async {
    var response = await dio.get('/products/detail/$id');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("/products/detail$id Olib kelishda hatolik bor");
    }
  }

  Future<List<dynamic>> fetchProduct({
    Map<String, dynamic>? queryParams,
  }) async {
    var response = await dio.get(
      '/products/list',
      queryParameters: queryParams,
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/product/list error");
    }
  }

  Future<dynamic> fetchMyCard() async {
    var response = await dio.get("/my-cart/my-cart-items");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Xatolik bor");
    }
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/products/list error");
    }
  }

  Future<List<dynamic>> fetchSizesList() async {
    var response = await dio.get('/sizes/list');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/sizes/list error");
    }
  }

  Future<List<dynamic>> fetchSavedProducts() async {
    var response = await dio.get('/products/saved-products');
    if (response.statusCode == 200) {
      return List.from(response.data);
    } else {
      throw Exception("/products/list error");
    }
  }

  Future<bool> fetchIsLike(int id) async {
    final response = await dio.post("/auth/save/$id");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> fetchUnLike(int id) async {
    final response = await dio.post("/auth/unsave/$id");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<dynamic>> fetchReviewsList(int id) async {
    final response = await dio.get("/reviews/list/$id");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/reviews/list error");
    }
  }

  Future<Map<String, dynamic>> fetchReviewsStars(int id) async {
    final response = await dio.get("/reviews/stats/$id");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw Exception("/reviews/list error");
    }
  }

  Future<List<dynamic>> fetchMyOrders()async{
    final response = await dio.get("/orders/list");
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception("My Order list error");
    }
  }
  Future<bool> deleteCard(int id)async{
    final response = await dio.delete("/cards/delete/$id");
    print(response.statusCode);
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }
}
