import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/book_details/presentation/view_models/book_details_cubit/book_details_cubit.dart';
import 'package:bookly/features/book_details/presentation/view_models/reviews_cubit/reviews_cubit.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/reviews_section.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/add_review_and_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/also_like_books_section.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/core/widgets/custom_button_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookId});
  final int bookId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        if (state is BookDetailsSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BookDetailsSection(bookDetails: state.bookDetails),
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
                    ],
                  ),
                ),

                // Display exactly 3 reviews
                SliverToBoxAdapter(
                  child: BlocConsumer<ReviewsCubit, ReviewsState>(
                    builder: (context, state) {
                      if (state is ReviewsSuccess) {
                        return ReviewsSection(
                          reviews: state.reviews,
                          hasMoreReviews: state.hasMoreReviews,
                          isLoadingMoreReviews: state.isLoadingMoreReviews,
                          onSeeMore: () {
                            context.read<ReviewsCubit>().getReviews(bookId);
                          },
                        );
                      }

                      return const SizedBox();
                    },
                    listener: (context, state) {
                      if (state is ReviewsFailure) {
                        showSnackBar(context, title: state.errMessage);
                      }
                    },
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
        } else if (state is BookDetailsLoading) {
          return const Center(child: CustomLoadingIndicator());
        }

        return const SizedBox();
      },
      listener: (context, state) {
        if (state is BookDetailsFailure) {
          showSnackBar(context, title: state.errMessage);
        }
      },
    );
  }
}
