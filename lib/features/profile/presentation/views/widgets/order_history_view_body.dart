import 'package:bookly/features/profile/presentation/views/widgets/order_item_card.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_summary_card.dart';
import 'package:bookly/features/profile/presentation/views/widgets/status_filter_bar.dart';
import 'package:flutter/material.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          const StatusFilterBar(),
          const SizedBox(height: 20),
          const OrderSummaryCard(),
          const SizedBox(height: 16),
          const OrderItemCard(),
        ],
      ),
    );
  }
}
