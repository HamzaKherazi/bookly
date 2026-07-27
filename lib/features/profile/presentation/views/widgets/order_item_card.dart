import 'package:bookly/constants.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_book_item.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_details_sheet.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_footer.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_header.dart';
import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderHeader(),
          const SizedBox(height: 12),
          const OrderBookItem(
            title: 'The Art of Flutter Development',
            author: 'John Doe',
            format: 'Paperback',
            price: 24.99,
            quantity: 1,
          ),
          const SizedBox(height: 12),
          const OrderBookItem(
            title: 'Clean Architecture in Flutter',
            author: 'Jane Smith',
            format: 'Hardcover',
            price: 29.99,
            quantity: 1,
          ),
          const SizedBox(height: 12),
          OrderFooter(
            total: 54.98,
            onDetailsTap: () {
              showOrderDetails(context);
            },
          ),
        ],
      ),
    );
  }

  void showOrderDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.92,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return OrderDetailsSheet(scrollController: scrollController);
        },
      ),
    );
  }
}
