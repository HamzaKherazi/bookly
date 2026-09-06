import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/explore/presentation/view_models/books_cubit/books_cubit.dart';
import 'package:bookly/features/explore/presentation/views/widgets/explore_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreBooksGridView extends StatelessWidget {
  const ExploreBooksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is BooksSuccess) {
          return GridView.builder(
            padding: const EdgeInsets.only(top: 50),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 60,
            ),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final book = state.books[index];
              return ExploreBookItem(book: book);
            },
          );
        } else {
          return const Center(child: CustomLoadingIndicator());
        }
      },
      listener: (context, state) {
        if (state is BooksFailure) {
          showSnackBar(
            context,
            title: state.errMessage,
            backgroundColor: Colors.red,
          );
        }
      },
    );
  }
}
