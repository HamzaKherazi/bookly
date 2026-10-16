import 'package:bookly/core/failures/errors.dart';
import 'package:bookly/features/order/data/models/order_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderRepo {
  final SupabaseClient supabase;
  OrderRepo(this.supabase);

  Future<Either<Failure, OrderModel?>> getOrder() async {
    try {
      final userId = supabase.auth.currentUser!.id;
      final data = await supabase
          .from('orders')
          .select('''
      order_id,
      total_amount,
      created_at,
      order_items (
        order_item_id,
        book_id,
        quantity,
        unit_price,
        books (
          book_id,
          title,
          image_url,
          price,
          average_rating,
          rating_count,
          authors (
            first_name,
            last_name
          ),
          categories (
            name
          )
        )
      )
    ''')
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .limit(1)
          .maybeSingle();

      if (data == null) {
        return right(null);
      }

      return right(OrderModel.fromJson(data));
    } catch (e) {
      return left(SupabaseFailure('Failed to fetch order'));
    }
  }
}
