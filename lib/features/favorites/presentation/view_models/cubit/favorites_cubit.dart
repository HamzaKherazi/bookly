import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_preview_model.dart';
import 'package:bookly/features/favorites/data/repos/favorites_repo.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepo) : super(const FavoritesState());

  final FavoritesRepo favoritesRepo;

  Future<void> getFavorites() async {
    if (state.hasLoaded || state.isLoading) return;
    emit(state.copyWith(clearError: true, isLoading: true));
    final result = await favoritesRepo.getFavorites();
    result.fold(
      (failure) => emit(
        state.copyWith(isLoading: false, errorMessage: failure.errMessage),
      ),
      (favorites) => emit(
        state.copyWith(isLoading: false, hasLoaded: true, favorites: favorites),
      ),
    );
  }

  Future<void> addFavorite({required BookPreviewModel book}) async {
    emit(state.copyWith(clearError: true, action: Action.adding));

    final result = await favoritesRepo.addFavorite(book);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.errMessage)),
      (isAdded) {
        if (!isAdded) return;
        if (state.hasLoaded) {
          final updatedFavorites = [
            book,
            ...state.favorites.where((b) => b.bookId != book.bookId),
          ];
          emit(state.copyWith(favorites: updatedFavorites));
        }
      },
    );
  }

  Future<void> removeFavorite({required int bookId}) async {
    emit(state.copyWith(clearError: true, action: Action.removing));

    final result = await favoritesRepo.removeFavorite(bookId);

    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.errMessage)),
      (isRemoved) {
        if (!isRemoved) return;
        if (state.hasLoaded) {
          final updatedFavorites = state.favorites
              .where((b) => b.bookId != bookId)
              .toList();
          emit(state.copyWith(favorites: updatedFavorites));
        }
      },
    );
  }
}
