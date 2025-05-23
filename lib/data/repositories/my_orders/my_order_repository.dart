import 'package:store_app/core/client.dart';
import 'package:store_app/data/models/my_orders_model/my_order_model.dart';

class MyOrderRepository {
  final ApiClient client;

  MyOrderRepository({required this.client});

  Future<List<MyOrderModel>> fetchMyOrders() async {
    final rawOrders = await client.fetchMyOrders();
    final orders = rawOrders.map<MyOrderModel>((e) => MyOrderModel.fromJson(e)).toList();
    return orders;
  }
}
