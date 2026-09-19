import 'package:bookly/features/cart/data/models/cart_item_model.dart';

bool checkBookExistsInCart(List<CartItemModel> items, int bookId) {
  for (final item in items) {
    if (item.bookId == bookId) {
      return true;
    }
  }
  return false;
}
