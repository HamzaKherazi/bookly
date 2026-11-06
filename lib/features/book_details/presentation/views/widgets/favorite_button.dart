import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/models/book_preview_model.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/book_details/presentation/view_models/book_details_cubit/book_details_cubit.dart';
import 'package:bookly/features/favorites/data/repos/favorites_repo.dart';
import 'package:bookly/features/favorites/presentation/view_models/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  bool isClicked = false;
  BookPreviewModel? book;
  final favoritesRepo = getIt<FavoritesRepo>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookDetailsCubit, BookDetailsState>(
      listener: (context, state) async {
        if (state is BookDetailsSuccess) {
          book = BookPreviewModel(
            bookId: state.bookDetails.bookId,
            title: state.bookDetails.title,
            author: state.bookDetails.author,
            category: state.bookDetails.category,
            price: state.bookDetails.price,
            averageRating: state.bookDetails.averageRating,
            ratingCount: state.bookDetails.ratingCount,
            imageUrl: state.bookDetails.imgUrl,
          );
          final result = await favoritesRepo.isFavorite(
            state.bookDetails.bookId,
          );
          if (!mounted) return;
          result.fold(
            (failure) => showSnackBar(context, title: failure.errMessage),
            (value) => setState(() => isFavorite = value),
          );
        }
      },
      child: BlocConsumer<FavoritesCubit, FavoritesState>(
        listener: (context, state) {
          if (isClicked && state.errorMessage != null) {
            showSnackBar(context, title: state.errorMessage!);
            return;
          }
          if (isClicked && state.action == Action.adding) {
            setState(() => isFavorite = true);
            showSnackBar(context, title: 'Book added to favorites!');
            isClicked = false;
          }
          if (isClicked && state.action == Action.removing) {
            setState(() => isFavorite = false);
            showSnackBar(context, title: 'Book removed from favorites!');
            isClicked = false;
          }
        },
        builder: (context, state) => IconButton(
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          onPressed: () async {
            isClicked = true;
            if (isFavorite) {
              await context.read<FavoritesCubit>().removeFavorite(
                bookId: book!.bookId,
              );

              if (!mounted) return;
            } else {
              await context.read<FavoritesCubit>().addFavorite(book: book!);

              if (!mounted) return;
            }
          },
        ),
      ),
    );
  }
}
