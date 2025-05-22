import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/my_orders_model/my_order_model.dart';

part 'my_order_state.freezed.dart';

enum MyOrderStatus { loading, error, success }

@freezed
abstract class MyOrderState with _$MyOrderState {
  const factory MyOrderState({required MyOrderStatus status, required List<MyOrderModel> model}) = _MyOrderState;

  factory MyOrderState.initial() {
    return MyOrderState(status: MyOrderStatus.loading, model: []);
  }
}
