part of 'promos_cubit.dart';

@immutable
sealed class PromosState {}

final class PromosInitial extends PromosState {}

final class PromosLoading extends PromosState {}

final class PromosSuccess extends PromosState {
  final List<PromoModel> promos;

  PromosSuccess(this.promos);
}

final class PromosError extends PromosState {
  final String errMessage;

  PromosError(this.errMessage);
}
