import 'package:bookly/core/failures/errors.dart';
import 'package:bookly/features/book_details/data/models/book_details_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookDetailsRepo {
  final SupabaseClient supabase;

  BookDetailsRepo(this.supabase);

  Future<Either<Failure, BookDetailsModel>> getBookDetails(int bookId) async {
    try {
      final data = await supabase
          .from('books')
          .select('''
        book_id,
        title,
        image_url,
        average_rating,
        rating_count,
        description,
        price,
        authors (
            first_name,
            last_name
        ),
        categories (
            name
        )
    ''')
          .eq('book_id', bookId)
          .single();
      final book = BookDetailsModel.fromJson(data);
      return right(book);
    } catch (e) {
      return left(SupabaseFailure('Failed to fetch book details'));
    }
  }
}
