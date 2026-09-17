import 'package:bookly/core/errors/errors.dart';
import 'package:bookly/core/models/book_preview_model.dart';
import 'package:bookly/features/home/data/models/book_cover_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepo {
  final SupabaseClient supabase;

  HomeRepo(this.supabase);

  Future<Either<Error, List<BookCoverModel>>> getNewArrivals() async {
    try {
      final data = await supabase
          .from('books')
          .select('''
      book_id,
      image_url
    ''')
          .order('book_id', ascending: false)
          .limit(7);

      return right(data.map((json) => BookCoverModel.fromJson(json)).toList());
    } catch (e) {
      return left(SupabaseError('Failed to fetch books'));
    }
  }

  Future<Either<Error, List<BookPreviewModel>>> getBestSellergBooks() async {
    try {
      final data = await supabase.rpc(
        'get_best_seller_books',
        params: {'limit_count': 7},
      );
      final books = (data as List)
          .map((json) => BookPreviewModel.fromJson(json))
          .toList();

      return Right(books);
    } catch (e) {
      return Left(SupabaseError(e.toString()));
    }
  }

  
}
