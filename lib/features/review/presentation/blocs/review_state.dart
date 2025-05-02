import 'package:equatable/equatable.dart';
import 'package:store_app/data/models/reviews_model.dart';

enum ReviewStatus { idle, error, loading }

class ReviewState extends Equatable {
  const ReviewState({
    required this.status,
    required this.reviewsList,
    required this.reviewsStars,
  });

  final ReviewStatus? status;
  final ReviewsStarsModel reviewsStars;
  final List<ReviewsListModel> reviewsList;

  factory ReviewState.initial() {
    return ReviewState(
      status: ReviewStatus.loading,
      reviewsList: [],
      reviewsStars: ReviewsStarsModel(
        totalCount: 0,
        fiveStars: 0,
        fourStars: 0,
        threeStars: 0,
        twoStars: 0,
        oneStars: 0,
      ),
    );
  }

  ReviewState copyWith({
    ReviewStatus? status,
    List<ReviewsListModel>? reviewsList,
    ReviewsStarsModel? reviewsStars,
  }) {
    return ReviewState(
      status: status ?? this.status,
      reviewsList: reviewsList ?? this.reviewsList,
      reviewsStars: reviewsStars ?? this.reviewsStars,
    );
  }

  @override
  List<Object?> get props => [status, reviewsStars, reviewsList];
}
