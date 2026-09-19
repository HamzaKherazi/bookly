import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_cover_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'new_arrivals_state.dart';

class NewArrivalsCubit extends Cubit<NewArrivalsState> {
  NewArrivalsCubit(this.homeRepo) : super(NewArrivalsInitial());
  final HomeRepo homeRepo;

  Future<void> getNewArrivals() async {
    emit(NewArrivalsLoading());
    var result = await homeRepo.getNewArrivals();
    result.fold(
      (error) {
        emit(NewArrivalsFailure(error.errMessage));
      },
      (newArrivals) {
        emit(NewArrivalsSuccess(newArrivals));
      },
    );
  }
}
