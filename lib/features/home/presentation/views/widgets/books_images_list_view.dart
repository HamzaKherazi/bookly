import 'package:flutter/material.dart';

import 'book_cover.dart';

class BooksImagesListView extends StatelessWidget {
  const BooksImagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: BookCover(),
        );
      },
    );
  }
}
