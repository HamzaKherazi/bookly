import 'package:bloc/bloc.dart';
import 'package:bookly/features/explore/data/models/book_preview_model.dart';
import 'package:bookly/features/explore/data/repos/explore_repo.dart';
import 'package:meta/meta.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.exploreRepo) : super(BooksInitial());
  final ExploreRepo exploreRepo;

Future<void> getAllBooks() async {
    emit(BooksLoading());
    var result = await exploreRepo.getAllBooks();
    result.fold(
      (failure) => emit(BooksFailure(failure.errMessage)),
      (books) => emit(BooksSuccess(books)),
    );
  }

  Future<void> searchBooks(String search) async {
    emit(BooksLoading());
    var result = await exploreRepo.searchBooks(search);
    result.fold(
      (failure) => emit(BooksFailure(failure.errMessage)),
      (books) => emit(BooksSuccess(books)),
    );
  }

  Future<void> getBooksByCategory(int categoryId) async {
    emit(BooksLoading());
    var result = await exploreRepo.searchBooksByCategory(categoryId);
    result.fold(
      (failure) => emit(BooksFailure(failure.errMessage)),
      (books) => emit(BooksSuccess(books)),
    );
  }
  
}
