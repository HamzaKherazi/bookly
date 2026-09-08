import 'package:bookly/features/book_details/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ReviewItem();
      },
    );
  }
}
