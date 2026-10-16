import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/cart/data/models/cart_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Container(
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

      height: 135,

      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.7 / 4,
            child: cartItemModel.book!.imageUrl == null
                ? ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: Image.asset(kDefaultBookImage, fit: BoxFit.cover),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: cartItemModel.book!.imageUrl!,
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
                  cartItemModel.book!.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle18,
                ),

                const SizedBox(height: 2),

                Text(cartItemModel.book!.author, style: Styles.textStyle16),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${cartItemModel.book!.price} \$',
                      style: Styles.textStyle18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Text(
                        cartItemModel.quantity.toString(),
                        style: Styles.textStyle16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
