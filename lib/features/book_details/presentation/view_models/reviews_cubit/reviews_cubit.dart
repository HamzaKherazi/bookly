import 'package:bloc/bloc.dart';
import 'package:bookly/features/book_details/data/models/review_model.dart';
import 'package:bookly/features/book_details/data/repos/reviews_repo.dart';
import 'package:meta/meta.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this.reviewsRepo) : super(ReviewsInitial());

  final ReviewsRepo reviewsRepo;

  final List<ReviewModel> _reviews = [];

  int _offset = 0;
  final int _limit = 3;

  bool _hasMoreReviews = true;
  bool _isLoadingMore = false;

  Future<void> getReviews(int bookId) async {
    if (_isLoadingMore || !_hasMoreReviews) return;

    _isLoadingMore = true;

    if (_reviews.isEmpty) {
      emit(ReviewsLoading());
    } else {
      emit(
        ReviewsSuccess(
          reviews: List.from(_reviews),
          hasMoreReviews: _hasMoreReviews,
          isLoadingMoreReviews: true,
        ),
      );
    }

    final result = await reviewsRepo.getReviews(
      bookId: bookId,
      offset: _offset,
      limit: _limit,
    );

    result.fold(
      (error) {
        _isLoadingMore = false;
        emit(ReviewsError(error.errMessage));
      },
      (newReviews) {
        _reviews.addAll(newReviews);

        _offset += newReviews.length;

        if (newReviews.length < _limit) {
          _hasMoreReviews = false;
        }

        _isLoadingMore = false;

        emit(
          ReviewsSuccess(
            reviews: List.from(_reviews),
            hasMoreReviews: _hasMoreReviews,
            isLoadingMoreReviews: false,
          ),
        );
      },
    );
  }
}
