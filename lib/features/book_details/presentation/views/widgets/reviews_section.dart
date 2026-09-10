import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/book_details/data/models/review_model.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key, required this.reviews});

  final List<ReviewModel> reviews;

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  bool _showAllReviews = false;

  @override
  Widget build(BuildContext context) {
final reviews = widget.reviews
        .where((review) => review.comment?.trim().isNotEmpty ?? false)
        .toList();
    final reviewsToDisplay = _showAllReviews
        ? reviews
        : reviews.take(3).toList();

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
            children: reviewsToDisplay.map((review) {
              return ReviewItem(review: review);
            }).toList(),
          ),

        // More / Less button
        if (reviews.length > 3)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: InkWell(
              onTap: () {
                setState(() {
                  _showAllReviews = !_showAllReviews;
                });
              },
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
                    Text(
                      _showAllReviews
                          ? 'Show less reviews'
                          : 'See more reviews',
                      style: Styles.textStyle16.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      _showAllReviews
                          ? Icons.keyboard_arrow_up
                          : Icons.arrow_forward_ios,
                      color: kPrimaryColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
