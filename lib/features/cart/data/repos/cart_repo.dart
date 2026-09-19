import 'package:bookly/core/failures/errors.dart';
import 'package:bookly/features/cart/data/models/cart_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartRepo {
  final SupabaseClient supabase;

  CartRepo(this.supabase);
  Future<Either<Failure, CartModel?>> getCart() async {
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
          .order(
            'cart_item_id',
            ascending: false,
            referencedTable: 'cart_items',
          )
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
      return Left(SupabaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> updateQuantity(
    int cartItemId,
    int quantity,
  ) async {
    try {
      final userId = supabase.auth.currentUser!.id;

      // 1. Get the authenticated user's cart
      final cart = await supabase
          .from('carts')
          .select('cart_id')
          .eq('user_id', userId)
          .single();

      final cartId = cart['cart_id'];

      // 2. Update only the item belonging to this cart
      await supabase
          .from('cart_items')
          .update({'quantity': quantity})
          .eq('cart_item_id', cartItemId)
          .eq('cart_id', cartId);

      return Right(true);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> removeItem(int cartItemId) async {
    try {
      await supabase.from('cart_items').delete().eq('cart_item_id', cartItemId);
      return Right(null);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> removeAllItems(int cartId) async {
    try {
      await supabase.from('cart_items').delete().eq('cart_id', cartId);
      return Right(null);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> saveCart(CartModel cart) async {
    try {
      final items = cart.items.map((item) {
        return {
          'cart_item_id': item.cartItemId,
          'book_id': item.bookId,
          'quantity': item.quantity,
        };
      }).toList();

      await supabase.rpc(
        'save_cart',
        params: {'p_cart_id': cart.cartId, 'p_items': items},
      );

      return const Right(null);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, int>> addItemToCart(int bookId) async {
    try {
      final userId = supabase.auth.currentUser!.id;

      // 1. Get the authenticated user's cart
      var cart = await supabase
          .from('carts')
          .select('cart_id')
          .eq('user_id', userId)
          .maybeSingle();
      cart =
          cart ??
          await supabase
              .from('carts')
              .insert({'user_id': userId})
              .select('cart_id')
              .single();

      final cartId = cart['cart_id'];

      final insertedItem = await supabase
          .from('cart_items')
          .insert({'cart_id': cartId, 'book_id': bookId, 'quantity': 1})
          .select('cart_item_id')
          .single();

      final cartItemId = insertedItem['cart_item_id'] as int;

      return Right(cartItemId);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }
}
