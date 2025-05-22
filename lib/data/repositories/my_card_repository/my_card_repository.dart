import 'package:store_app/core/client.dart';

import '../../models/my_cart_model/my_cart_model.dart';

class MyCardRepository{
  final ApiClient client;
  MyCardRepository({required this.client});

  Future<MyCartModel> fetchMyCart() async {
    final rawCart = await client.fetchMyCard();
    return MyCartModel.fromJson(rawCart);
  }
}