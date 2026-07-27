import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/widgets.dart';

class BookPriceRow extends StatelessWidget {
  final double price;
  final int quantity;
  final bool showFullDetails;

  const BookPriceRow({
    super.key,
    required this.price,
    required this.quantity,
    this.showFullDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Qty: $quantity',
          style: Styles.textStyle14.copyWith(color: kTextColor2),
        ),
        if (showFullDetails && quantity > 1) ...[
          const SizedBox(width: 8),
          Text(
            'Total: \$${(price * quantity).toStringAsFixed(2)}',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
        ],
      ],
    );
  }
}
