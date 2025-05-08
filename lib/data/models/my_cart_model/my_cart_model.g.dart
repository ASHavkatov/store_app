// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCartModel _$MyCartModelFromJson(Map<String, dynamic> json) => MyCartModel(
  subTotal: (json['subTotal'] as num).toInt(),
  vat: (json['vat'] as num).toInt(),
  shippingFee: (json['shippingFee'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$MyCartModelToJson(MyCartModel instance) =>
    <String, dynamic>{
      'subTotal': instance.subTotal,
      'vat': instance.vat,
      'shippingFee': instance.shippingFee,
      'total': instance.total,
    };
