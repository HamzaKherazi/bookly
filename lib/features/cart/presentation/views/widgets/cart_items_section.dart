import 'package:bookly/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/widgets.dart';

class CartItemsSection extends StatelessWidget {
  const CartItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: const CartItem(),
            );
          },
        ),
      ),
    );
  }
}
