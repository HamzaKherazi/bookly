import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/book_cover_image.dart';
import 'package:bookly/features/orders_history/presentation/views/widgets/book_price_row.dart';
import 'package:flutter/widgets.dart';

class OrderBookItem extends StatelessWidget {
  final String title;
  final String author;
  final double price;
  final int quantity;
  final bool showFullDetails;

  const OrderBookItem({
    super.key,
    required this.title,
    required this.author,
    required this.price,
    required this.quantity,
    this.showFullDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BookCoverImage(),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500),
                maxLines: showFullDetails ? 2 : 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                'By $author',
                style: Styles.textStyle14.copyWith(color: kTextColor2),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              BookPriceRow(
                price: price,
                quantity: quantity,
                showFullDetails: showFullDetails,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
