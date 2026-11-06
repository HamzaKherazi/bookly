part of 'favorites_cubit.dart';

enum Action { none, adding, removing }

@immutable
class FavoritesState {
  final List<BookPreviewModel> favorites;
  
  final bool isLoading;
  final Action action;
  final bool hasLoaded;
  final String? errorMessage;

  const FavoritesState({
    this.favorites = const [],
    this.isLoading = false,
    this.action = Action.none,
    this.hasLoaded = false,
    this.errorMessage,
  });

  FavoritesState copyWith({
    List<BookPreviewModel>? favorites,
    bool? isLoading,
    Action? action,
    bool? hasLoaded,
    String? errorMessage,
    bool clearError = false,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
      action: action ?? this.action,
      hasLoaded: hasLoaded ?? this.hasLoaded,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}
