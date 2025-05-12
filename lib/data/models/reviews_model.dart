class ReviewsListModel {
  final int id;
  final int rating;
  final String comment, userFullName;
  final DateTime created;

  ReviewsListModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.userFullName,
    required this.created,
  });

  factory ReviewsListModel.fromJson(Map<String, dynamic> json) {
    return ReviewsListModel(
      id: json['id'],
      comment: json['comment'],
      rating: json['rating'],
      created: DateTime.parse(json['created']),
      userFullName: json['userFullName'],
    );
  }
}

class ReviewsStarsModel {
  final int totalCount;
  final int fiveStars;
  final int fourStars;
  final int threeStars;
  final int twoStars;
  final int oneStars;

  ReviewsStarsModel({
    required this.totalCount,
    required this.fiveStars,
    required this.fourStars,
    required this.threeStars,
    required this.twoStars,
    required this.oneStars,
  });

  factory ReviewsStarsModel.fromJson(Map<String, dynamic> json){
    return ReviewsStarsModel(
        totalCount: json['totalCount'],
        fiveStars: json['fiveStars'],
        fourStars: json['fourStars'],
        threeStars: json['threeStars'],
        twoStars: json['twoStars'],
        oneStars: json['oneStars']);
  }
}
