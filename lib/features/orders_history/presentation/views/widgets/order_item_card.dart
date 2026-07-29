import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/helpers/show_order_details.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/order_book_item.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/order_footer.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/order_header.dart';
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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return const OrderBookItem(
                title: 'The Art of Flutter Development',
                author: 'John Doe',
                price: 24.99,
                quantity: 1,
              );
            },
          ),

          //if orders contains >2 items
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              //orderItems.length - 2
              '+${5 - 2} more items',
              style: Styles.textStyle14.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
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
}
