// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
  id: (json['id'] as num).toInt(),
  cardNumber: json['cardNumber'] as String,
);

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
  'id': instance.id,
  'cardNumber': instance.cardNumber,
};
