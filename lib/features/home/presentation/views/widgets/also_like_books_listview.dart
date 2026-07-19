import 'package:bookly/features/home/presentation/views/widgets/book_cover.dart';
import 'package:flutter/material.dart';

class AlsoLikeBooksListView extends StatelessWidget {
  const AlsoLikeBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: BookCover(),
          );
        },
      ),
    );
  }
}
