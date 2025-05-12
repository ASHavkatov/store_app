import 'package:hive/hive.dart';

class ProductModel {
  final int id;
  final String image;
  final String title;
  final num price;
  final bool isLiked;
  final num discount;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.discount,
    required this.isLiked,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      price: json['price'],
      isLiked: json['isLiked'],
      discount: json['discount'],
    );
  }

  ProductModel copyWith({
    int? id,
    int? discount,
    String? image,
    String? title,
    num? price,
    bool? isLike,
  }) {
    return ProductModel(
      id: id ?? this.id,
      image: image ?? this.image,
      title: title ?? this.title,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      isLiked: isLike ?? isLiked,
    );
  }
}

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  int get typeId => 0;

  @override
  ProductModel read(BinaryReader reader) {
    return ProductModel(
      id: reader.read(),
      title: reader.readString(),
      price: reader.read(),
      image: reader.readString(),
      discount: reader.read(),
      isLiked: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer.write(obj.id);
    writer.writeString(obj.title);
    writer.write(obj.price);
    writer.write(obj.image);
    writer.write(obj.discount);
    writer.write(obj.isLiked);
  }
}
