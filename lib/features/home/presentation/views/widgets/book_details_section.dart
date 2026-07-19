import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_cover.dart';
import 'package:bookly/features/home/presentation/views/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.23),
          child: const BookCover(),
        ),
        const SizedBox(height: 43),

        //Book title
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Al-Raheeq Al-Makhtoum',
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
            'By Al-Mubarakfuri',

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
            'Religion',

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
            const BookRating(mainAxisAlignment: MainAxisAlignment.start),
            Text(
              '19.99 \$',

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
                "The Sealed Nectar (Ar-Raheeq Al-Makhtum) by Safi-ur-Rahman al-Mubarakpuri is a well-known and highly respected biography of the Prophet Muhammad ﷺ. It presents a detailed and authentic account of his life, from his noble lineage and early childhood to his prophethood, struggles in Makkah, migration to Madinah, and the establishment of the Muslim community. The book is written in a clear, chronological style and is based on authentic historical sources. It highlights key events such as the revelation of the Qur’an, major battles, treaties, and the moral and spiritual character of the Prophet ﷺ. It won first prize in a worldwide biography competition organized by the Muslim World League, which helped it gain global recognition. Overall, it is considered one of the most comprehensive and accessible seerah (biography of the Prophet ﷺ) books for readers who want to understand Islamic history in depth.",
          ),
        ),
      ],
    );
  }
}
