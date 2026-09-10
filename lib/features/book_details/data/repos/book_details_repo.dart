import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/book_details/data/models/book_details_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookDetailsRepo {
  final SupabaseClient supabase;

  BookDetailsRepo(this.supabase);

  Future<Either<Failure, BookDetailsModel>> getBookDetails(int bookId) async {
    try {
      final data = await supabase.rpc(
        'get_book_details',
        params: {'p_book_id': bookId},
      );
      final book = BookDetailsModel.fromJson(data as Map<String, dynamic>);
      return right(book);
    } catch (e) {
      return left(SupabaseFailure('Failed to fetch book details'));
    }
  }
}
