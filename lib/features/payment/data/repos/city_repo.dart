import 'package:bookly/core/failures/errors.dart';
import 'package:bookly/features/payment/data/models/city_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CitiesRepo {
  final SupabaseClient supabase;

  CitiesRepo(this.supabase);

  Future<Either<Failure, List<CityModel>>> getCities() async {
    try {
      final data = await supabase
          .from('cities')
          .select('city_id, name, shipping_cost')
          .order('name');
      final cities = (data as List).map((city) {
        return CityModel.fromJson(city);
      }).toList();
      return right(cities);
    } catch (e) {
      return left(SupabaseFailure(e.toString()));
    }
  }
}
