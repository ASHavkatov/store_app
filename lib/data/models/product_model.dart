class ProductModel {
  final int id;
  final String image;
  final String title;
  final num price, discount;
  final bool isLiked;

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
      discount: json['discount']
    );
  }
}
