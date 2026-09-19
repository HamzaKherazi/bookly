import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_button_with_icon.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartCheckoutSection extends StatelessWidget {
  const CartCheckoutSection({super.key, required this.totalAmount});
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag Handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Order Total (Centered, Large)
                Column(
                  children: [
                    Text(
                      'Order total',
                      style: Styles.textStyle14.copyWith(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '\$ ${totalAmount.toStringAsFixed(2)}',
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w700,
                        color: kPrimaryColor,
                        fontSize: 32,
                        letterSpacing: -0.8,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Checkout Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: CustomButtonWithIcon(
                    onPressed: () async {
                      await BlocProvider.of<CartCubit>(context).saveCart();
                      if (context.mounted) {
                        context.push(AppRouter.orderSummaryView);
                      }
                    },
                    title: 'Checkout',
                    icon: Icons.arrow_forward_rounded,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
