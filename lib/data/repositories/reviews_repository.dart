import '../../core/client.dart';
import '../models/reviews_model.dart';

class ReviewsRepository {
  ReviewsRepository({required this.client});

  final ApiClient client;

  List<ReviewsListModel>? reviewsList;
  ReviewsStarsModel? reviewsStars;

  Future<ReviewsStarsModel> fetchReviewsStars(int id) async {
    final rawReviewStars = await client.fetchReviewsStars(id);
    reviewsStars = ReviewsStarsModel.fromJson(rawReviewStars);
    return reviewsStars!;
  }

  Future<List<ReviewsListModel>> fetchReviewsList(int id) async {
    final rawReviewList = await client.fetchReviewsList(id);
    reviewsList =
        rawReviewList.map((reviewsList) =>
            ReviewsListModel.fromJson(reviewsList as Map<String, dynamic>))
            .toList();
    return reviewsList!;
  }
}
