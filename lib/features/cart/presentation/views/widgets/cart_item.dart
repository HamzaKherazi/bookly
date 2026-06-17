import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/cart/presentation/views/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView);
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

        height: 135,

        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.network(
                      'https://booksondemand.ma/cdn/shop/files/Atomic.png?v=1727078355&width=1100',
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(8),
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
                    'The Sealed Nectar',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle18.copyWith(
                      fontFamily: kgTSectraFine,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text('Mubarakfuri', style: Styles.textStyle16),

                  const SizedBox(height: 16),
                  Text(
                    '19.99 \$',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close, size: 20, color: Colors.black54),
                ),

                SizedBox(height: 10),

                Counter(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
