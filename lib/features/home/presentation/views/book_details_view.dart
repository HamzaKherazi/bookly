import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:bookly/features/home/presentation/views/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        actions: [FavoriteButton()],
      ),
      body: BookDetailsViewBody(),
    );
  }
}
