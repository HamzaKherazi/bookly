import 'package:bookly/core/failures/errors.dart';
import 'package:bookly/features/book_request/data/models/request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RequestRepo {
  final SupabaseClient supabase;

  RequestRepo(this.supabase);

  Future<Either<Failure, bool>> addRequest({
    required RequestModel request,
  }) async {
    try {
      final response = await supabase
          .from('book_requests')
          .insert({
            'user_id': supabase.auth.currentUser!.id,
            'book_title': request.bookTitle,
            'author_name': request.authorName,
          })
          .select('request_id')
          .maybeSingle();
      return Right(response != null);
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }
}
