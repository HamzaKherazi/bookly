import 'package:bookly/constants.dart';
import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/favorites/presentation/view_models/cubit/favorites_cubit.dart';
import 'package:bookly/features/favorites/presentation/views/widgets/favorite_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: kPrimaryColor,
        onRefresh: () async {
          await context.read<FavoritesCubit>().getFavorites();
        },
        child: BlocConsumer<FavoritesCubit, FavoritesState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              showSnackBar(context, title: state.errorMessage!);
            }
          },
          builder: (context, state) {
            if (state.isLoading && !state.hasLoaded) {
              return const Center(child: CustomLoadingIndicator());
            }
            if (state.favorites.isEmpty) {
              return Center(child: Text('No favorites yet.'));
            }
            if (state.favorites.isNotEmpty) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  return FavoriteBookItem(key: 
                  ValueKey(state.favorites[index].bookId),
                    bookPreviewModel: state.favorites[index],
                  );
                },
              );
            }

            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [],
            );
          },
        ),
      ),
    );
  }
}
