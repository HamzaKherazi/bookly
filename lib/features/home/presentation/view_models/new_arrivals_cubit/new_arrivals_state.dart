part of 'new_arrivals_cubit.dart';

@immutable
sealed class NewArrivalsState {}

final class NewArrivalsInitial extends NewArrivalsState {}

final class NewArrivalsLoading extends NewArrivalsState {}

final class NewArrivalsSuccess extends NewArrivalsState {
  final List<BookCoverModel> newArrivals;

  NewArrivalsSuccess(this.newArrivals);
}

final class NewArrivalsError extends NewArrivalsState {
  final String errMessage;

  NewArrivalsError(this.errMessage);
}
