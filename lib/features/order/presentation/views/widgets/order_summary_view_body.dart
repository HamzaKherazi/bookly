import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_button_with_icon.dart';
import 'package:bookly/features/order/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderSummaryViewBody extends StatefulWidget {
  const OrderSummaryViewBody({super.key});

  @override
  State<OrderSummaryViewBody> createState() => _OrderSummaryViewBodyState();
}

class _OrderSummaryViewBodyState extends State<OrderSummaryViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const OrderItem(),
                );
              },
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Total Amount', style: Styles.textStyle18),
                  Text('24 \$', style: Styles.textStyle24),
                ],
              ),
              CustomButtonWithIcon(onPressed: () {}, title: 'Checkout'),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
