import 'package:bookly/core/errors/errors.dart';
import 'package:bookly/features/cart/data/models/cart_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartRepo {
  final SupabaseClient supabase;

  CartRepo(this.supabase);
  Future<Either<Error, CartModel?>> getCart() async {
    try {
      final data = await supabase
          .from('carts')
          .select('''
          cart_id,
          user_id,
          created_at,
          cart_items (
            cart_item_id,
            cart_id,
            book_id,
            quantity,
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
          .eq('user_id', supabase.auth.currentUser!.id)
          .maybeSingle();

      if (data == null) {
        return right(null);
      }

      final items = (data['cart_items'] as List).map((item) {
        return {
          'cart_item_id': item['cart_item_id'],
          'cart_id': item['cart_id'],
          'book_id': item['book_id'],
          'quantity': item['quantity'],
          'book': item['books'],
        };
      }).toList();

      final cartJson = {
        'cart_id': data['cart_id'],
        'user_id': data['user_id'],
        'created_at': data['created_at'],
        'items': items,
      };

      return Right(CartModel.fromJson(cartJson));
    } catch (e) {
      return Left(SupabaseError(e.toString()));
    }
  }
}
