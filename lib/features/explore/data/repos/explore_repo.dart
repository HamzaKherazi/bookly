import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/explore/data/models/book_preview_model.dart';
import 'package:bookly/features/explore/data/models/category_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExploreRepo {
  final SupabaseClient supabase;

  ExploreRepo(this.supabase);

  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final data = await supabase
          .from('categories')
          .select('category_id, name')
          .order('name', ascending: true);
      final categories = [
        CategoryModel(categoryId: -1, name: 'All'),
        ...data.map((json) => CategoryModel.fromJson(json)),
      ];

      return right(categories);
    } catch (e) {
      return left(SupabaseFailure('Failed to fetch categories'));
    }
  }

  Future<Either<Failure, List<BookPreviewModel>>> getAllBooks() async {
    try {
      final data = await supabase
          .from('books')
          .select('''
      book_id,
      title,
      price,
      average_rating,
      rating_count,
      image_url,
      authors (
        first_name,
        last_name
      ),
      categories (
        name
      )
    ''')
          .order('language_id', ascending: true)
          .order('title', ascending: true);

      return right(
        data.map((json) => BookPreviewModel.fromJson(json)).toList(),
      );
    } catch (e) {
      return left(SupabaseFailure('Failed to fetch books'));
    }
  }

  Future<Either<Failure, List<BookPreviewModel>>> searchBooks(
    String search,
  ) async {
    try {
      final data = await supabase
          .from('books')
          .select('''
          book_id,
          title,
          price,
          average_rating,
          rating_count,
          image_url,
          authors (
            first_name,
            last_name
          ),
          categories (
            name
          )
        ''')
          .or(
            'title.ilike.%$search%,'
            'authors.first_name.ilike.%$search%,'
            'authors.last_name.ilike.%$search%',
          );

      return right(
        data.map((json) => BookPreviewModel.fromJson(json)).toList(),
      );
    } catch (e) {
      return left(SupabaseFailure('Failed to search books'));
    }
  }

  Future<Either<Failure, List<BookPreviewModel>>> searchBooksByCategory(
    int categoryId,
  ) async {
    try {
      final data = await supabase
          .from('books')
          .select('''
          book_id,
          title,
          price,
          average_rating,
          rating_count,
          image_url,
          authors (
            first_name,
            last_name
          ),
          categories (
            name
          )
        ''')
          .eq('category_id', categoryId);

      return right(
        data.map((json) => BookPreviewModel.fromJson(json)).toList(),
      );
    } catch (e) {
      return left(SupabaseFailure('Failed to fetch books by category'));
    }
  }
}
