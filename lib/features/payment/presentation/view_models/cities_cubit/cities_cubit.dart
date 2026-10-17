import 'package:bloc/bloc.dart';
import 'package:bookly/features/payment/data/models/city_model.dart';
import 'package:bookly/features/payment/data/repos/city_repo.dart';
import 'package:meta/meta.dart';

part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit(this.cityRepo) : super(CitiesInitial());

  final CitiesRepo cityRepo;

  Future<void> getCities() async {
    emit(CitiesLoading());

    final cities = await cityRepo.getCities();
    cities.fold(
      (failure) => emit(CitiesError(failure.errMessage)),
      (cities) => emit(CitiesSuccess(cities)),
    );
  }
}
