import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.24),
      child: Column(
        children: [
          const CustomBookImage(),
          const SizedBox(height: 43),
          Text(
            'Al-Raheeq',
            maxLines: 2,
            style: Styles.textStyle30,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            'Al-Mubarakfuri',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
          const BookRating(),
        ],
      ),
    );
  }
}
