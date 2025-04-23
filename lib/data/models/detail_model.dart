class DetailModel {
  final int id;
  final String title, desc;
  final int price;
  final bool isLiked;
  final int reviewCount;
  final num rating;
  final List<DetailImageModel> productImage;
  DetailModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.price,
    required this.isLiked,
    required this.reviewCount,
    required this.rating,
    required this.productImage,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'],
      title: json['title'],
      desc: json['description'],
      price: json['price'],
      isLiked: json['isLiked'],
      reviewCount: json['reviewsCount'],
      rating: json['rating'],
      productImage:
          (json['productImages'] as List)
              .map((e) => DetailImageModel.fromJson(e))
              .toList(),
    );
  }
}

class DetailImageModel {
  final int id;
  final String image;

  DetailImageModel({required this.image, required this.id});

  factory DetailImageModel.fromJson(Map<String, dynamic> json) {
    return DetailImageModel(image: json['image'], id: json['id']);
  }
}

