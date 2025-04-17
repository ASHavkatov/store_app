import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/product_model.dart';

enum MyOrderStatus { idle, loading, error, success }

class MyOrderState extends Equatable {
  MyOrderState({required this.status, required this.products});

  final MyOrderStatus? status;
  final List<ProductModel>? products;

  factory MyOrderState.initial() {
    return MyOrderState(status: MyOrderStatus.loading, products: []);
  }

  MyOrderState copyWith({
    MyOrderStatus? status,
    List<ProductModel>? products,
  }) {
    return MyOrderState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [status, products];
}
