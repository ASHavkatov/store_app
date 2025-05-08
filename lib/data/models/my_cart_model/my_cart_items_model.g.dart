// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_cart_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCartItemsModel _$MyCartItemsModelFromJson(Map<String, dynamic> json) =>
    MyCartItemsModel(
      title: json['title'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      size: json['size'] as String,
      quantity: json['quantity'] as String,
      items: const MyCartItemsModelConverter().fromJson(json['items'] as List),
    );

Map<String, dynamic> _$MyCartItemsModelToJson(MyCartItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'size': instance.size,
      'price': instance.price,
      'image': instance.image,
      'quantity': instance.quantity,
      'items': const MyCartItemsModelConverter().toJson(instance.items),
    };
