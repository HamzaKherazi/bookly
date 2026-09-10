part of 'book_details_cubit.dart';

@immutable
sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}

final class BookDetailsLoading extends BookDetailsState {}

final class BookDetailsSuccess extends BookDetailsState {
  final BookDetailsModel bookDetails;

  BookDetailsSuccess(this.bookDetails);
}

final class BookDetailsFailure extends BookDetailsState {
  final String errMessage;

  BookDetailsFailure(this.errMessage);
}
