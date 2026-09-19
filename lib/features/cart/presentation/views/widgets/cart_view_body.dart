import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:bookly/features/cart/presentation/views/helper/get_total_amount.dart';
import 'package:bookly/features/cart/presentation/views/widgets/cart_items_section.dart';
import 'package:bookly/features/cart/presentation/views/widgets/cart_checkout_section.dart';
import 'package:bookly/features/cart/presentation/views/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          showSnackBar(context, title: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is CartLoading) {
          return CustomLoadingIndicator();
        }
        if (state is CartSuccess) {
          if (state.cart == null || state.cart!.items.isEmpty) {
            return Center(
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
                    style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Browse our collection and discover amazing books',
                    style: Styles.textStyle14.copyWith(
                      color: Colors.grey.shade500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            );
          }
          return Column(
            // ← REMOVED the Padding wrapper
            children: [
              // Modern Header - with padding
              HeaderSection(itemsCount: state.cart!.items.length),
              // Cart Items List - with padding
              CartItemsSection(items: state.cart!.items),
              // Premium Checkout Section - FULL WIDTH (no padding wrapper)
              CartCheckoutSection(
                totalAmount: getTotalAmount(state.cart!.items),
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
