import 'package:bookly/features/cart/data/models/cart_item_model.dart';

double getTotalAmount(List<CartItemModel> items) {
  return items.fold<double>(
    0,
    (sum, item) => sum + item.quantity * item.book!.price,
  );
}
