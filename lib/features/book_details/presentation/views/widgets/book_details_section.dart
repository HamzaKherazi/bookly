import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/book_details/data/models/book_details_model.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/book_rating.dart';
import 'package:bookly/core/widgets/book_cover.dart';
import 'package:bookly/core/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookDetails});
  final BookDetailsModel bookDetails;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.23),
          child: BookCover(imgUrl: bookDetails.imgUrl),
        ),
        const SizedBox(height: 43),

        //Book title
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            bookDetails.title,
            maxLines: 2,
            style: Styles.textStyle24.copyWith(fontFamily: 'Inter'),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 2),

        //Book author
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            bookDetails.author,
            style: Styles.textStyle18.copyWith(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: kTextColor1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 2),

        //Book Category
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            bookDetails.category,
            style: Styles.textStyle14.copyWith(
              fontFamily: 'Inter',

              fontWeight: FontWeight.w500,
              color: kTextColor1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 6),

        //Rating and Price
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BookRating(
              avgRating: bookDetails.avgRating,
              ratingCount: bookDetails.ratingCount,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            Text(
              '${bookDetails.price.toStringAsFixed(2)} \$',

              style: Styles.textStyle18.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: kTextColor1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        //Description
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Description',

            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
              color: kTextColor1,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Align(
          alignment: Alignment.centerLeft,
          child: ExpandableText(
            text:
                bookDetails.description ??
                'No description available for this book.',
          ),
        ),
      ],
    );
  }
}
