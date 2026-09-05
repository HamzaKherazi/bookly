import 'package:bookly/features/explore/data/repos/explore_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<SupabaseClient>(Supabase.instance.client);
  getIt.registerSingleton<ExploreRepo>(ExploreRepo(getIt<SupabaseClient>()));
}
