import 'package:bookly/features/order/presentation/views/widgets/checkout_section.dart';
import 'package:bookly/features/order/presentation/views/widgets/header_section.dart';
import 'package:bookly/features/order/presentation/views/widgets/order_items_section.dart';
import 'package:flutter/material.dart';

class OrderSummaryViewBody extends StatefulWidget {
  const OrderSummaryViewBody({super.key});

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
        OrderItemsSection(),

        // Clean Checkout Section
        CheckoutSection(),
      ],
    );
  }
}
