import 'package:flutter/material.dart';

class OrderItemsHeader extends StatelessWidget {
  const OrderItemsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '2 Items',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
