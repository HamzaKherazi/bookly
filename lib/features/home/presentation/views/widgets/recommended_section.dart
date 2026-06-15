import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_images_list_view.dart';
import 'package:flutter/material.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'Recommended',
          style: Styles.textStyle18.copyWith(color: kTextColor1),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.24,

          child: BooksImagesListView(),
        ),
      ],
    );
  }
}
