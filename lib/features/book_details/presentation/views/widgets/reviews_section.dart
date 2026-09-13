import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/book_details/data/models/review_model.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
    required this.reviews,
    required this.hasMoreReviews,
    required this.isLoadingMoreReviews,
    required this.onSeeMore,
  });

  final List<ReviewModel> reviews;
  final bool hasMoreReviews;
  final bool isLoadingMoreReviews;
  final VoidCallback onSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),

        // Reviews
        if (reviews.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'No reviews available for this book.',
              style: Styles.textStyle14.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: Colors.grey[500],
                fontSize: 13,
              ),
            ),
          )
        else
          Column(
            children: reviews
                .map((review) => ReviewItem(review: review))
                .toList(),
          ),

        // See more
        if (hasMoreReviews && reviews.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: InkWell(
              onTap: isLoadingMoreReviews ? null : onSeeMore,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: kPrimaryColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLoadingMoreReviews)
                      const SizedBox(
                        width: 16,
                        height: 16,
                        child: CustomLoadingIndicator(),
                      )
                    else ...[
                      Text(
                        'See more reviews',
                        style: Styles.textStyle16.copyWith(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: kPrimaryColor,
                        size: 16,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
