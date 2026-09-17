import 'package:bookly/features/book_details/data/repos/book_details_repo.dart';
import 'package:bookly/features/book_details/data/repos/reviews_repo.dart';
import 'package:bookly/features/cart/data/repos/cart_repo.dart';
import 'package:bookly/features/explore/data/repos/explore_repo.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/promos/data/repos/promos_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);
  getIt.registerSingleton<ExploreRepo>(ExploreRepo(getIt<SupabaseClient>()));
  getIt.registerSingleton<BookDetailsRepo>(
    BookDetailsRepo(getIt<SupabaseClient>()),
  );
  getIt.registerSingleton<ReviewsRepo>(ReviewsRepo(getIt<SupabaseClient>()));
  getIt.registerSingleton<PromosRepo>(PromosRepo(getIt<SupabaseClient>()));
  getIt.registerSingleton<HomeRepo>(HomeRepo(getIt<SupabaseClient>()));
  getIt.registerSingleton<CartRepo>(CartRepo(getIt<SupabaseClient>()));
}
