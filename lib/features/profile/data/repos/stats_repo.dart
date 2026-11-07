import 'package:bookly/core/failures/errors.dart';
import 'package:bookly/features/profile/data/models/stats_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StatsRepo {
  final SupabaseClient supabase;

  StatsRepo(this.supabase);

  Future<Either<Failure, StatsModel>> getStats() async {
    try {
      final response = await supabase.rpc('get_stats');

      return Right(StatsModel.fromJson(Map<String, dynamic>.from(response)));
    } catch (e) {
      return Left(SupabaseFailure(e.toString()));
    }
  }
}
