// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCartModel _$MyCartModelFromJson(Map<String, dynamic> json) => MyCartModel(
  subTotal: json['subTotal'] as num,
  items: const MyCartItemsModelConverter().fromJson(json['items'] as List),
  vat: json['vat'] as num,
  shippingFee: json['shippingFee'] as num,
  total: json['total'] as num,
);

Map<String, dynamic> _$MyCartModelToJson(MyCartModel instance) =>
    <String, dynamic>{
      'items': const MyCartItemsModelConverter().toJson(instance.items),
      'subTotal': instance.subTotal,
      'vat': instance.vat,
      'shippingFee': instance.shippingFee,
      'total': instance.total,
    };
