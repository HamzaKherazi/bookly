import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_preview_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this.homeRepo) : super(BestSellerInitial());

  final HomeRepo homeRepo;
  Future<void> getBestSeller() async {
    emit(BestSellerLoading());
    var result = await homeRepo.getBestSellergBooks();
    result.fold(
      (error) {
        emit(BestSellerError(error.errMessage));
      },
      (books) {
        emit(BestSellerSuccess(books));
      },
    );
  }
}
