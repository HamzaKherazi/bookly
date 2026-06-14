import 'package:bookly/features/home/presentation/views/widgets/also_like_books_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_button_with_icon.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BookDetailsSection(),
                const SizedBox(height: 20),

                CustomButtonWithIcon(onPressed: () {}, title: 'Add to cart'),

                const Expanded(child: SizedBox(height: 50)),
                const AlsoLikeBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
