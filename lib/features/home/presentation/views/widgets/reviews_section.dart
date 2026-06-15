import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/customer_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/expandable_text.dart';
import 'package:bookly/features/home/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',

          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w600,
            color: kTextColor1,
          ),
        ),
        const SizedBox(height: 16),

        ReviewItem(),
        const SizedBox(height: 8),

        ReviewItem(),
      ],
    );
  }
}
