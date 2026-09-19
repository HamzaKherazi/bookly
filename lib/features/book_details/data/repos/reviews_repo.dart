import 'package:bookly/core/failures/errors.dart';
import 'package:bookly/features/book_details/data/models/review_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReviewsRepo {
  final SupabaseClient supabase;
  ReviewsRepo(this.supabase);

  Future<Either<Failure, List<ReviewModel>>> getReviews({
    required int bookId,
    int offset = 0,
    int limit = 3,
  }) async {
    try {
      final data = await supabase
          .from('reviews')
          .select('''
          review_id,
          book_id,
          rating,
          comment,
          created_at,
          users (
            first_name,
            last_name
          )
        ''')
          .eq('book_id', bookId)
          .not('comment', 'is', null)
          .neq('comment', '')
          .order('created_at', ascending: false)
          .order('review_id', ascending: false)
          .range(offset, offset + limit - 1);

      final reviews = (data as List).map((review) {
        final user = review['users'];

        return ReviewModel(
          reviewId: review['review_id'],
          bookId: review['book_id'],
          userName: '${user['first_name']} ${user['last_name']}',
          rating: review['rating'],
          comment: review['comment'],
        );
      }).toList();

      return right(reviews);
    } catch (e) {
      return left(SupabaseFailure('Failed to fetch reviews'));
    }
  }
}
