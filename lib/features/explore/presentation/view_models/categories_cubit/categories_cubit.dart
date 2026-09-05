import 'package:bloc/bloc.dart';
import 'package:bookly/features/explore/data/models/category_model.dart';
import 'package:bookly/features/explore/data/repos/explore_repo.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.exploreRepo) : super(CategoriesInitial());

  final ExploreRepo exploreRepo;

  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    var result = await exploreRepo.getAllCategories();
    result.fold(
      (failure) => emit(CategoriesFailure(failure.errMessage)),
      (categories) => emit(CategoriesSuccess(categories)),
    );
  }
}
