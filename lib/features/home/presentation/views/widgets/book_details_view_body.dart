import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/also_like_books_listview.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const CustomBookImage(),
          ),
          const SizedBox(height: 43),
          Text(
            'Al-Raheeq Al-Makhtoum',
            maxLines: 2,
            style: Styles.textStyle30,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            'Al-Mubarakfuri',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(height: 37),

          BooksAction(onPressed: () {}, price: '19.99'),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('You can also like', style: Styles.textStyle18),
          ),
          const SizedBox(height: 14),

          AlsoLikeBooksListView(),
        ],
      ),
    );
  }
}
