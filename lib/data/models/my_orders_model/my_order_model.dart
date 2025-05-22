import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_order_model.g.dart';

@JsonSerializable()
class MyOrderModel {
  final int id;
  final String title;
  final String image;
  final String size;
  final int price;
  final String status;
  final num? rating;

  MyOrderModel({
    required this.id,
    required this.title,
    required this.image,
    required this.size,
    required this.price,
    required this.status,
    this.rating,
  });

  factory MyOrderModel.fromJson(Map<String,dynamic> json)=> _$MyOrderModelFromJson(json);
  Map<String,dynamic> toJson()=> _$MyOrderModelToJson(this);
}
