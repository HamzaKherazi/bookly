import 'package:bookly/core/failures/errors.dart';
import 'package:bookly/features/order/data/models/create_order_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderRepo {
  final SupabaseClient supabase;
  OrderRepo(this.supabase);

  Future<Either<Failure, int>> createOrder(CreateOrderModel order) async {
    try {
      final userId = supabase.auth.currentUser!.id;
      final orderId = await supabase.rpc(
        'create_order',
        params: {
          'p_user_id': userId,
          'p_shipping_address': order.shippingAddress,
          'p_city_id': order.cityId,
          'p_payment_method_id': order.paymentMethodId,
          'p_delivery_fees': order.deliveryFees,
          'p_items': order.items
              .map(
                (item) => {'book_id': item.bookId, 'quantity': item.quantity},
              )
              .toList(),
        },
      );

      final int createdOrderId = (orderId as num).toInt();
      return right(createdOrderId);
    } catch (e) {
      return left(SupabaseFailure('Failed to create order'));
    }
  }
}
