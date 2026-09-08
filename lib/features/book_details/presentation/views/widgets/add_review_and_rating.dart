import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AddReviewAndRatingSection extends StatefulWidget {
  const AddReviewAndRatingSection({super.key});

  @override
  State<AddReviewAndRatingSection> createState() =>
      _AddReviewAndRatingSectionState();
}

class _AddReviewAndRatingSectionState extends State<AddReviewAndRatingSection> {
  final TextEditingController _reviewController = TextEditingController();
  double rating = 0;
  int selectedStar = 0;

  @override
  void initState() {
    super.initState();
    // Add listener to detect text changes
    _reviewController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 235, 224),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Your Review',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          // Rating Stars
          Row(
            children: [
              Text(
                'Rating: ',
                style: Styles.textStyle14.copyWith(color: Colors.grey.shade700),
              ),
              ...List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    setState(() {
                      selectedStar = index + 1;
                      rating = selectedStar.toDouble();
                    });
                  },
                  icon: Icon(
                    index < selectedStar ? Icons.star : Icons.star_border,
                    color: index < selectedStar
                        ? Colors.amber
                        : Colors.grey.shade400,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 24,
                );
              }),
              if (selectedStar > 0)
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Text(
                    '$selectedStar/5',
                    style: Styles.textStyle14.copyWith(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          // Review Text Field
          TextField(
            controller: _reviewController,
            maxLines: 3,
            maxLength: 500,
            decoration: InputDecoration(
              hintText: 'Write your review here...',
              hintStyle: Styles.textStyle14.copyWith(
                color: Colors.grey.shade400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
          const SizedBox(height: 12),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedStar == 0 || _reviewController.text.isEmpty
                  ? null
                  : () {
                      // Submit review logic here
                      setState(() {
                        // You can add your review submission logic here
                        // For example: add review to a list, call API, etc.
                      });

                      showSnackBar(
                        context,
                        title: 'Review submitted successfully!',
                        icon: Icons.check_circle_outline,
                      );

                      // Clear the form
                      _reviewController.clear();
                      setState(() {
                        selectedStar = 0;
                        rating = 0;
                      });
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 180, 64, 31),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                disabledBackgroundColor: Colors.grey.shade300,
                disabledForegroundColor: Colors.grey.shade500,
              ),
              child: Text(
                'Submit Review',
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
