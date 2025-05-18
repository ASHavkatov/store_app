import 'package:json_annotation/json_annotation.dart';
part"new_card_model.g.dart";

@JsonSerializable()
class NewCardModel{
  final String cardNumber;
  final String expiryDate;
  final String securityCode;

  NewCardModel({required this.cardNumber, required this.expiryDate, required this.securityCode});

  factory NewCardModel.fromJson(Map<String, dynamic>json) => _$NewCardModelFromJson(json);

  Map<String, dynamic>toJson() => _$NewCardModelToJson(this);
}