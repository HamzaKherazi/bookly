import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/also_like_books_listview.dart';
import 'package:flutter/material.dart';

class AlsoLikeBooksSection extends StatelessWidget {
  const AlsoLikeBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('You can also like', style: Styles.textStyle18),
        const SizedBox(height: 14),

        AlsoLikeBooksListView(),
      ],
    );
  }
}
