import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.2),
      child: Column(
        children: [
          const CustomBookImage(),
          const Text('Raheeq', style: TextStyle(fontSize: 24)),
          const Text('Raheeq', style: TextStyle(fontSize: 24)),
          const Text('Raheeq', style: TextStyle(fontSize: 24)),
          const BookRating(),
        ],
      ),
    );
  }
}
