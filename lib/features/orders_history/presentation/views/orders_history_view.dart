import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/order_history_view_body.dart';
import 'package:flutter/material.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        title: Text('Order History', style: Styles.textStyle22),
        centerTitle: true,
      ),
      body: OrderHistoryViewBody(),
    );
  }
}
