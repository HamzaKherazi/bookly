import 'package:bookly/constants.dart';
import 'package:bookly/core/app_responsive/app_responsive.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
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
        ).push('${AppRouter.bookDetailsView}/${cartItem.book!.bookId}');
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

        height: AppResponsive.height(context) * 0.16,

        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: cartItem.book!.imageUrl == null
                  ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      child: Image.asset(kDefaultBookImage, fit: BoxFit.cover),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: cartItem.book!.imageUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Image.asset(kDefaultBookImage, fit: BoxFit.cover),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: kPrimaryColor),
                      ),
                    ),
            ),

            const SizedBox(width: 30),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cartItem.book!.title,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle16.copyWith(fontSize: 13.sp),
                  ),

                  SizedBox(height: 2.h),

                  Text(
                    cartItem.book!.author,
                    style: Styles.textStyle14.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 6.h),
                  Text(
                    '${cartItem.book!.price.toStringAsFixed(2)} \$',
                    style: Styles.textStyle14.copyWith(
                      fontSize: 13.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
