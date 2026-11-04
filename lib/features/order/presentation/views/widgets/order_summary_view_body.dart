import 'package:bookly/features/cart/data/models/cart_model.dart';
import 'package:bookly/features/order/presentation/views/widgets/checkout_section.dart';
import 'package:bookly/features/order/presentation/views/widgets/header_section.dart';
import 'package:bookly/features/order/presentation/views/widgets/order_items_section.dart';
import 'package:flutter/material.dart';

class OrderSummaryViewBody extends StatefulWidget {
  const OrderSummaryViewBody({
    super.key,
    required this.cart,
    required this.totalAmount,
  });
  final CartModel cart;
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
        OrderItemsSection(items: widget.cart.items),

        // Clean Checkout Section
        CheckoutSection(),
      ],
    );
  }
}
