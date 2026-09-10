import 'package:bloc/bloc.dart';
import 'package:bookly/features/book_details/data/models/book_details_model.dart';
import 'package:bookly/features/book_details/data/repos/book_details_repo.dart';
import 'package:meta/meta.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit(this.bookDetailsRepo) : super(BookDetailsInitial());
  final BookDetailsRepo bookDetailsRepo;

  Future<void> getBookDetails(int bookId) async {
    emit(BookDetailsLoading());
    var result = await bookDetailsRepo.getBookDetails(bookId);
    result.fold(
      (failure) => emit(BookDetailsFailure(failure.errMessage)),
      (bookDetails) => emit(BookDetailsSuccess(bookDetails)),
    );
  }
}
