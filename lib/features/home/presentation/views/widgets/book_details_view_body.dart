import 'package:bookly/features/home/presentation/views/widgets/also_like_books_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
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
              children: const [
                BookDetailsSection(),

                Expanded(child: SizedBox(height: 50)),
                AlsoLikeBooksSection(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
