import 'package:bookly/constants.dart';
import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/add_review_and_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/also_like_books_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_button_with_icon.dart';
import 'package:bookly/features/home/presentation/views/widgets/review_item.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BookDetailsSection(),
                const SizedBox(height: 30),

                CustomButtonWithIcon(
                  onPressed: () {
                    showSnackBar(
                      context,
                      title: 'Added succesfully to cart',
                      icon: Icons.check_circle_outline,
                    );
                  },
                  title: 'Add to cart',
                  icon: Icons.shopping_cart,
                ),

                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Reviews',
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),

          // Display exactly 3 reviews
          SliverList.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ReviewItem();
            },
          ),

          // See more reviews button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: InkWell(
                onTap: () {
                  // Logic will be implemented later
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
                  ),
                ),
              ),
            ),
          ),

          // AddReviewAndRating widget
          const SliverToBoxAdapter(child: AddReviewAndRatingSection()),

          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 50),
                const AlsoLikeBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
