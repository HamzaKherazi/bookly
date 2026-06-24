import 'package:bookly/constants.dart';
import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/styles.dart';
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

          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ReviewItem();
            },
          ),

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
