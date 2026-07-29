import 'package:bookly/features/orders_history/presentation/views/widgets/order_date_text.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/timeline_steps.dart';
import 'package:flutter/material.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Timeline',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        const OrderDateText(),
        const SizedBox(height: 12),
        const TimelineSteps(),
      ],
    );
  }
}
