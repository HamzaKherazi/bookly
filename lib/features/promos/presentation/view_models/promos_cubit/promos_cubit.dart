import 'package:bloc/bloc.dart';
import 'package:bookly/features/promos/data/models/promo_model.dart';
import 'package:bookly/features/promos/data/repos/promos_repo.dart';
import 'package:meta/meta.dart';

part 'promos_state.dart';

class PromosCubit extends Cubit<PromosState> {
  PromosCubit(this.promosRepo) : super(PromosInitial());
  final PromosRepo promosRepo;

  Future<void> getAllPromos() async {
    emit(PromosLoading());
    var result = await promosRepo.getAllPromos();
    result.fold(
      (error) {
        emit(PromosError(error.errMessage));
      },
      (promos) {
        emit(PromosSuccess(promos));
      },
    );
  }
}
