part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsSuccess extends ReviewsState {
  final List<ReviewModel> reviews;
  final bool hasMoreReviews;
  final bool isLoadingMoreReviews;

  ReviewsSuccess({
    required this.reviews,
    this.hasMoreReviews = true,
    this.isLoadingMoreReviews = false,
  });
}

final class ReviewsError extends ReviewsState {
  final String errMessage;

  ReviewsError(this.errMessage);
}
