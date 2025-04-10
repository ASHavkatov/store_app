class ProductModel {
  final int id;
  final String image;
  final String title;
  final double price, discount;
  final bool isLiked;

  ProductModel({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.discount,
    required this.isLiked,
  });

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "image" : image,
      "title" : title,
      "price" : price,
      "isLiked" : isLiked,
      "discount" : discount,
    };
  }
}
