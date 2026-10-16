import 'package:bookly/features/cart/data/models/cart_item_model.dart';
import 'package:bookly/features/order/presentation/views/widgets/order_item.dart';
import 'package:flutter/widgets.dart';

class OrderItemsSection extends StatelessWidget {
  const OrderItemsSection({super.key, required this.items});
  final List<CartItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: OrderItem(cartItemModel: items[index]),
            );
          },
        ),
      ),
    );
  }
}
