import 'package:freezed_annotation/freezed_annotation.dart';

import 'my_cart_items_model.dart';

part 'my_cart_model.g.dart';

@JsonSerializable()
class MyCartModel {
  @MyCartItemsModelConverter()
  final List<MyCartItemsModel> items;
  final num subTotal;
  final num vat;
  final num shippingFee;
  final num total;

  MyCartModel({
    required this.subTotal,
    required this.items,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });

  @override
  String toString() {
    return 'MyCartModel(total: $total, items: $items, vat: $vat)';
  }
  factory MyCartModel.fromJson(Map<String, dynamic> json) => _$MyCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyCartModelToJson(this);
}

