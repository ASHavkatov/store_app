import 'package:json_annotation/json_annotation.dart';
part"card_model.g.dart";

@JsonSerializable()
class CardModel{
  final int id;
  final String cardNumber;

  CardModel({required this.id, required this.cardNumber});
  factory CardModel.fromJson(Map<String, dynamic>json)=> _$CardModelFromJson(json);
}
