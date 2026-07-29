import 'package:bookly/constants.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/order_details_sheet.dart';
import 'package:flutter/material.dart';

void showOrderDetails(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: kBackgroundColor,
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
