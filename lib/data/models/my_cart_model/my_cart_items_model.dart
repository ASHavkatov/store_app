import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_cart_items_model.g.dart';

@JsonSerializable()
class MyCartItemsModel {
  final int id;
  final String title;
  final String size;
  final int price;
  final String image;
  final String quantity;
@MyCartItemsModelConverter()
  final List<MyCartItemsModel> items;

  MyCartItemsModel( {
    required this.title,
    required this.image,
    required this.price,
    required this.id,
    required this.size,
    required this.quantity,
    required this.items,
  });

  factory MyCartItemsModel.fromJson(Map<String, dynamic> json) =>
      _$MyCartItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyCartItemsModelToJson(this);
}

class MyCartItemsModelConverter
    implements JsonConverter<List<MyCartItemsModel>, List<dynamic>> {
 const MyCartItemsModelConverter();

  @override
  List<MyCartItemsModel> fromJson(List<dynamic> json) {
    return json.map((e) => MyCartItemsModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<MyCartItemsModel> object) {
    return object.map((e) => e.toJson()).toList();
  }
}
