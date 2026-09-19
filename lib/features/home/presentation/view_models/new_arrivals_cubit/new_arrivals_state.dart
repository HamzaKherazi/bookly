part of 'new_arrivals_cubit.dart';

@immutable
sealed class NewArrivalsState {}

final class NewArrivalsInitial extends NewArrivalsState {}

final class NewArrivalsLoading extends NewArrivalsState {}

final class NewArrivalsSuccess extends NewArrivalsState {
  final List<BookCoverModel> newArrivals;

  NewArrivalsSuccess(this.newArrivals);
}

final class NewArrivalsFailure extends NewArrivalsState {
  final String errMessage;

  NewArrivalsFailure(this.errMessage);
}
