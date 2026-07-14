import 'package:bookly/features/cart/presentation/views/widgets/cart_items_section.dart';
import 'package:bookly/features/cart/presentation/views/widgets/cart_checkout_section.dart';
import 'package:bookly/features/cart/presentation/views/widgets/header_section.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool hasItems = true;
  @override
  Widget build(BuildContext context) {
    return !hasItems
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.grey.shade100, Colors.grey.shade50],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.grey.shade400,
                    size: MediaQuery.of(context).size.width * .4,
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Your cart is empty',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Browse our collection and discover amazing books',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          )
        : Column(
            // ← REMOVED the Padding wrapper
            children: [
              // Modern Header - with padding
              HeaderSection('P87Yh'),
              // Cart Items List - with padding
              CartItemsSection(),
              // Premium Checkout Section - FULL WIDTH (no padding wrapper)
              Padding(
                padding: const EdgeInsets.all(16),
                child: CartCheckoutSection(),
              ),
            ],
          );
  }
}
