import 'package:bookly/features/home/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        const SizedBox(height: 16),

        ReviewItem(),
        const SizedBox(height: 8),

        ReviewItem(),
      ],
    );
  }
}
