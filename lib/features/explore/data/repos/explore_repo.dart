import 'package:bookly/features/explore/data/models/book_preview_model.dart';
import 'package:bookly/features/explore/data/models/category_model.dart';

abstract class ExploreRepo {
  Future<List<CategoryModel>> fetchCtegories();
  Future<List<BookPreviewModel>> fetchBooks();
  Future<List<BookPreviewModel>> searchBooks(String search);
}
