import 'package:bookly/constants.dart';
import 'package:flutter/widgets.dart';

class BookCoverImage extends StatelessWidget {
  const BookCoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 64,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: NetworkImage(
            'https://via.placeholder.com/48x64/7B3F2F/FFFFFF?text=Book',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
