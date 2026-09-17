part of 'best_seller_cubit.dart';

@immutable
sealed class BestSellerState {}

final class BestSellerInitial extends BestSellerState {}

final class BestSellerLoading extends BestSellerState {}

final class BestSellerSuccess extends BestSellerState {
  final List<BookPreviewModel> bestSellerBooks;

  BestSellerSuccess(this.bestSellerBooks);
}

final class BestSellerError extends BestSellerState {
  final String errMessage;

  BestSellerError(this.errMessage);
}
