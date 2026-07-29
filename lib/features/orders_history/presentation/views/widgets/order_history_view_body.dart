import 'package:bookly/features/orders_history/presentation/views/widgets/order_item_card.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/order_summary_card.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/status_filter_bar.dart';
import 'package:flutter/material.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: StatusFilterBar()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: OrderSummaryCard()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(top: 10),
                child: OrderItemCard(),
              ),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
