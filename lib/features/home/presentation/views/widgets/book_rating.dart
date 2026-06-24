import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star, color: const Color.fromARGB(255, 255, 221, 0)),
        ),
        Text(
          '4.8',
          style: Styles.textStyle14.copyWith(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, right: 8),
          child: Text(
            '(2390)',
            style: Styles.textStyle14.copyWith(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
