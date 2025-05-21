// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrderModel _$MyOrderModelFromJson(Map<String, dynamic> json) => MyOrderModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  image: json['image'] as String,
  size: json['size'] as String,
  price: (json['price'] as num).toInt(),
  status: json['status'] as String,
  rating: json['rating'] as num,
);

Map<String, dynamic> _$MyOrderModelToJson(MyOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'size': instance.size,
      'price': instance.price,
      'status': instance.status,
      'rating': instance.rating,
    };
