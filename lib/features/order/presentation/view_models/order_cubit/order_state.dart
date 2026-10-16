part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final OrderModel? order;

  OrderSuccess(this.order);
}

class OrderFailure extends OrderState {
  final String errMessage;

  OrderFailure(this.errMessage);
}
