// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => _DetailModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toInt(),
  isLiked: json['isLiked'] as bool,
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  rating: json['rating'] as num,
  productImage: (json['productImages'] as List<dynamic>)
      .map((e) => DetailImageModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DetailModelToJson(_DetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'isLiked': instance.isLiked,
      'reviewsCount': instance.reviewsCount,
      'rating': instance.rating,
      'productImages': instance.productImage,
    };

_DetailImageModel _$DetailImageModelFromJson(Map<String, dynamic> json) =>
    _DetailImageModel(
      image: json['image'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$DetailImageModelToJson(_DetailImageModel instance) =>
    <String, dynamic>{'image': instance.image, 'id': instance.id};
