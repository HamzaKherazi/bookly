part of 'book_details_cubit.dart';

@immutable
sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}

final class BookDetailsLoading extends BookDetailsState {}

final class BookDetailsSuccess extends BookDetailsState {
  final BookDetailsModel bookDetails;

  BookDetailsSuccess({required this.bookDetails});
}

final class BookDetailsError extends BookDetailsState {
  final String errMessage;

  BookDetailsError(this.errMessage);
}
