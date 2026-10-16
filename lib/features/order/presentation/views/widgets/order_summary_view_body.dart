import 'package:bookly/features/cart/data/models/cart_item_model.dart';
import 'package:bookly/features/order/presentation/views/widgets/checkout_section.dart';
import 'package:bookly/features/order/presentation/views/widgets/header_section.dart';
import 'package:bookly/features/order/presentation/views/widgets/order_items_section.dart';
import 'package:flutter/material.dart';

class OrderSummaryViewBody extends StatefulWidget {
  const OrderSummaryViewBody({
    super.key,
    required this.items,
    required this.totalAmount,
  });
  final List<CartItemModel> items;
  final double totalAmount;

  @override
  State<OrderSummaryViewBody> createState() => _OrderSummaryViewBodyState();
}

class _OrderSummaryViewBodyState extends State<OrderSummaryViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Clean, Minimal Header
        HeaderSection(),

        // Order Items with Delivery Info
        OrderItemsSection(items: widget.items),

        // Clean Checkout Section
        CheckoutSection(totalPrice: widget.totalAmount),
      ],
    );
  }
}
