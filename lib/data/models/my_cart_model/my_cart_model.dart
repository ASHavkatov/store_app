import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_cart_model.g.dart';

@JsonSerializable()
class MyCartModel {
  final int subTotal;
  final int vat;
  final int shippingFee;
  final int total;

  MyCartModel({
    required this.subTotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });

  factory MyCartModel.fromJson(Map<String, dynamic>json) => _$MyCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyCartModelToJson(this);
}


