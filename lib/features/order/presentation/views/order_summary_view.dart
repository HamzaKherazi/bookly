import 'package:bookly/constants.dart';
import 'package:bookly/features/order/presentation/views/widgets/order_summary_view_body.dart';
import 'package:flutter/material.dart';

class OrderSummaryView extends StatelessWidget {
  const OrderSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        title: Text(
          'Order Summary',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: OrderSummaryViewBody(),
    );
  }
}
