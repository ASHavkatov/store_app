import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/models/my_cart_model/my_cart_model.dart';

part 'my_cart_state.freezed.dart';

enum MyCartStatus { idle, loading, error }

@freezed
abstract class MyCartState with _$MyCartState {
  const factory MyCartState({
    required MyCartModel model,
    required MyCartStatus status,
  }) = _MyCartState;

  factory MyCartState.initial() {
    return MyCartState(model: MyCartModel(subTotal: 0, items: [], vat: 0, shippingFee: 1, total: 10), status: MyCartStatus.loading);
  }
}
