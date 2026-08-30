import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/explore/data/models/book_preview_model.dart';
import 'package:bookly/features/explore/data/models/category_model.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepo {
  Future<Either<Failure, List<CategoryModel>>> fetchCategories();
  Future<Either<Failure, List<BookPreviewModel>>> fetchBooks();
  Future<Either<Failure, List<BookPreviewModel>>> searchBooks(String search);
  Future<Either<Failure, List<BookPreviewModel>>> searchBooksByCategory(String category);
}


