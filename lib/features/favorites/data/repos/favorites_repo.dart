import 'package:bookly/core/failures/errors.dart';
import 'package:bookly/core/models/book_preview_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesRepo {
  final SupabaseClient supabase;
  FavoritesRepo(this.supabase);

  Future<Either<Failure, List<BookPreviewModel>>> getFavorites() async {
    try {
      final user = supabase.auth.currentUser;

      final response = await supabase
          .from('favorites')
          .select('''
          books (
            book_id,
            title,
            price,
            image_url,
            average_rating,
            rating_count,
            authors (
              first_name,
              last_name
            ),
            categories (
              name
            )
          )
        ''')
          .eq('user_id', user!.id)
          .order('created_at', ascending: false);

      final favorites = (response as List)
          .map((item) => BookPreviewModel.fromJson(item['books']))
          .toList();

      return Right(favorites);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> addFavorite(BookPreviewModel book) async {
    try {
      final user = supabase.auth.currentUser;

      final favorite = await supabase
          .from('favorites')
          .insert({'user_id': user!.id, 'book_id': book.bookId})
          .select('favorite_id')
          .maybeSingle();

      return Right(favorite != null);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> isFavorite(int bookId) async {
    try {
      final user = supabase.auth.currentUser;

      final response = await supabase
          .from('favorites')
          .select('favorite_id')
          .eq('user_id', user!.id)
          .eq('book_id', bookId)
          .maybeSingle();

      return Right(response != null);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> removeFavorite(int bookId) async {
    try {
      final user = supabase.auth.currentUser;

      final response = await supabase
          .from('favorites')
          .delete()
          .eq('user_id', user!.id)
          .eq('book_id', bookId)
          .select('favorite_id');

      return Right(response.isNotEmpty);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }
}
