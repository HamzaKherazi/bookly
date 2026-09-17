import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/cart/presentation/views/widgets/total_amount_section.dart';
import 'package:bookly/core/widgets/custom_button_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartCheckoutSection extends StatelessWidget {
  const CartCheckoutSection({super.key, required this.totalAmount});
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 254, 253),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, -8),
          ),
        ],
        border: Border(top: BorderSide(color: Colors.grey.shade100, width: 1)),
      ),
      child: Column(
        children: [
          // Total - Responsive
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Left side - Total Amount
              TotalAmountSection(totalAmount: totalAmount),
              // Right side - Checkout Button
              SizedBox(
                height: 50,
                child: CustomButtonWithIcon(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.orderSummaryView);
                  },
                  title: 'Checkout',
                  icon: Icons.payments,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
