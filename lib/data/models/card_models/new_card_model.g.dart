// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCardModel _$NewCardModelFromJson(Map<String, dynamic> json) => NewCardModel(
  cardNumber: json['cardNumber'] as String,
  expiryDate: json['expiryDate'] as String,
  securityCode: json['securityCode'] as String,
);

Map<String, dynamic> _$NewCardModelToJson(NewCardModel instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'expiryDate': instance.expiryDate,
      'securityCode': instance.securityCode,
    };
