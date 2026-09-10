import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/book_details/data/repos/book_details_repo.dart';
import 'package:bookly/features/book_details/presentation/view_models/book_details_cubit/book_details_cubit.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/book_details_view_body.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookId});
  final int bookId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        actions: [FavoriteButton()],
      ),
      body: BlocProvider(
        create: (_) =>
            BookDetailsCubit(getIt.get<BookDetailsRepo>())
              ..getBookDetails(bookId),
        child: BookDetailsViewBody(bookId: bookId),
      ),
    );
  }
}
