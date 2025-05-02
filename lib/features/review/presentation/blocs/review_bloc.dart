import 'package:bloc/bloc.dart';
import 'package:store_app/data/repositories/reviews_repository.dart';
import 'package:store_app/features/review/presentation/blocs/review_event.dart';
import 'package:store_app/features/review/presentation/blocs/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewsRepository _reviewRepo;

  ReviewBloc({required ReviewsRepository reviewRepo})
      : _reviewRepo = reviewRepo,
        super(ReviewState.initial()) {
    on<ReviewLoad>(_onLoad);
  }

  Future<void> _onLoad(ReviewLoad event, Emitter<ReviewState> emit) async {
    emit(state.copyWith(status: ReviewStatus.loading));

    final reviewsStars = await _reviewRepo.fetchReviewsStars(event.id);
    final reviewsList = await _reviewRepo.fetchReviewsList(event.id);

    emit(state.copyWith(
      status: ReviewStatus.idle,
      reviewsList: reviewsList,
      reviewsStars: reviewsStars,
    ));
  }
}
