// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => _DetailModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  desc: json['desc'] as String,
  price: (json['price'] as num).toInt(),
  isLiked: json['isLiked'] as bool,
  reviewCount: (json['reviewCount'] as num).toInt(),
  rating: json['rating'] as num,
  productImage:
      (json['productImages'] as List<dynamic>)
          .map((e) => DetailImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DetailModelToJson(_DetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'price': instance.price,
      'isLiked': instance.isLiked,
      'reviewCount': instance.reviewCount,
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
