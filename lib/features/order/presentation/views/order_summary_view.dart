import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/cart/data/models/cart_item_model.dart';
import 'package:bookly/features/order/presentation/views/widgets/order_summary_view_body.dart';
import 'package:flutter/material.dart';

class OrderSummaryView extends StatelessWidget {
  const OrderSummaryView({
    super.key,
    required this.items,
    required this.totalAmount,
  });
  final List<CartItemModel> items;
  final double totalAmount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        title: Text('Order Summary', style: Styles.textStyle22),
        centerTitle: true,
      ),
      body: OrderSummaryViewBody(items: items, totalAmount: totalAmount),
    );
  }
}
