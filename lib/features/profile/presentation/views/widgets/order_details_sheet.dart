import 'package:bookly/features/cart/presentation/views/widgets/order_summary_section.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_book_item.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_details_header.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_items_header.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_timeline.dart';
import 'package:bookly/features/profile/presentation/views/widgets/sheet_drag_handle.dart';
import 'package:bookly/features/profile/presentation/views/widgets/shipping_payment_info.dart';
import 'package:flutter/material.dart';

class OrderDetailsSheet extends StatelessWidget {
  final ScrollController scrollController;

  const OrderDetailsSheet({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SheetDragHandle(),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderDetailsHeader(),
                  SizedBox(height: 20),
                  OrderTimeline(),
                  SizedBox(height: 24),
                  OrderItemsHeader(),
                  SizedBox(height: 12),
                  OrderBookItem(
                    title: 'The Art of Flutter Development',
                    author: 'John Doe',
                    format: 'Paperback',
                    price: 24.99,
                    quantity: 1,
                    showFullDetails: true,
                  ),
                  SizedBox(height: 12),
                  OrderBookItem(
                    title: 'Clean Architecture in Flutter',
                    author: 'Jane Smith',
                    format: 'Hardcover',
                    price: 29.99,
                    quantity: 1,
                    showFullDetails: true,
                  ),
                  SizedBox(height: 12),
                  OrderSummarySection(orderId: '#BK-2026-001'),
                  SizedBox(height: 16),
                  ShippingPaymentInfo(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
