import 'package:bookly/constants.dart';
import 'package:bookly/core/app_responsive/app_responsive.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/book_cover.dart';
import 'package:bookly/features/cart/data/models/cart_item_model.dart';
import 'package:bookly/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:bookly/features/cart/presentation/views/widgets/counter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.bookDetailsView, extra: cartItem.book!.bookId);
      },
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        height: AppResponsive.height(context) * 0.14,

        child: Row(
          children: [
            SizedBox(
              width: AppResponsive.width(context) * 0.2,
              child: BookCover(imgUrl: cartItem.book!.imageUrl),
            ),

            const SizedBox(width: 24),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BookTitle(title: cartItem.book!.title),
                  const SizedBox(height: 4),
                  AuthorInfo(author: cartItem.book!.author),
                  const SizedBox(height: 8),
                  PriceTag(price: cartItem.book!.price),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(
                      context,
                    ).removeItem(cartItem.cartItemId);
                  },
                  icon: Icon(Icons.close, size: 20.sp, color: Colors.black54),
                ),

                SizedBox(height: 10.h),

                Counter(
                  cartItemId: cartItem.cartItemId,
                  quantity: cartItem.quantity,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BookTitle extends StatelessWidget {
  const BookTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Styles.textStyle14.copyWith(
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1A1A2E),
        height: 1.3,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({super.key, required this.author});

  final String author;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.person, size: 12, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          author,
          style: Styles.textStyle14.copyWith(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        category,
        style: Styles.textStyle14.copyWith(
          fontSize: 11,
          color: Colors.blue[700],
        ),
      ),
    );
  }
}

class PriceTag extends StatelessWidget {
  const PriceTag({super.key, required this.price});
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 252, 215),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '\$${price.toStringAsFixed(2)}',
        style: Styles.textStyle14.copyWith(
          fontSize: 11,
          color: const Color.fromARGB(255, 8, 74, 49),
        ),
      ),
    );
  }
}
