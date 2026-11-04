import 'package:bookly/features/order/data/models/create_order_model.dart';
import 'package:bookly/features/order/data/models/order_model.dart';
import 'package:bookly/features/order/data/repos/order_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;
  OrderCubit(this.orderRepo) : super(OrderInitial());

  Future<void> createOrder(CreateOrderModel order) async {
    final result = await orderRepo.createOrder(order);
    result.fold(
      (failure) => emit(OrderFailure(failure.errMessage)),
      (orderId) => emit(OrderCreated(orderId)),
    );
  }
}
