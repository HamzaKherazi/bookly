import 'package:bloc/bloc.dart';
import 'package:bookly/features/order/data/models/order_model.dart';
import 'package:bookly/features/order/data/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;
  OrderCubit(this.orderRepo) : super(OrderInitial());

  Future<void> getOrder() async {
    emit(OrderLoading());
    final result = await orderRepo.getOrder();
    result.fold(
      (failure) => emit(OrderFailure(failure.errMessage)),
      (order) => emit(OrderSuccess(order)),
    );
  }
}
