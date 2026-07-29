import 'package:bookly/features/orders_history/presentation/views/widgets/info_card.dart';
import 'package:flutter/material.dart';

class ShippingPaymentInfo extends StatelessWidget {
  const ShippingPaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InfoCard(
            icon: Icons.location_on_outlined,
            title: 'Shipping Address',
            detail: '123 Main St, New York, NY 10001',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InfoCard(
            icon: Icons.credit_card_outlined,
            title: 'Payment Method',
            detail: 'Visa ****1234',
          ),
        ),
      ],
    );
  }
}
