import 'package:bloc/bloc.dart';
import 'package:bookly/features/profile/data/repos/stats_repo.dart';
import 'package:bookly/features/profile/presentation/view_models/stats_cubit/stats_cubit.dart';
import 'package:meta/meta.dart';


class StatsCubit extends Cubit<StatsState> {
  StatsCubit(this.profileRepo) : super(StatsInitial());

  final StatsRepo profileRepo;

  Future<void> getStats() async {
    emit(StatsLoading());
    try {
      final result = await profileRepo.getStats();
      result.fold(
        (failure) => emit(StatsFailure(failure.toString())),
        (stats) => emit(StatsSuccess(stats)),
      );
    } catch (e) {
      emit(StatsFailure(e.toString()));
    }
  }
}
