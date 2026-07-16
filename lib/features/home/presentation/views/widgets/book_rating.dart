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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 249, 230),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFFFE082), width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, color: Color(0xFFFFB300), size: 16),
          const SizedBox(width: 4),
          Text(
            '4.8',
            style: Styles.textStyle14.copyWith(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1A2E),
              fontSize: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 8),
            child: Text(
              '(2390)',
              style: Styles.textStyle14.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: Colors.grey[500],
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
