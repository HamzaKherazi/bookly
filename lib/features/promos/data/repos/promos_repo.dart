import 'package:bookly/core/errors/errors.dart';
import 'package:bookly/features/promos/data/models/promo_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PromosRepo {
  final SupabaseClient supabase;

  PromosRepo(this.supabase);

  Future<Either<Error, List<PromoModel>>> getAllPromos() async {
    try {
      final data = await supabase
          .from('promos')
          .select('''
        promo_id,
        title,
        description,
        image_url,
        button_text,
        start_date,
        end_date,
        created_at,
        is_active
      ''')
          .order('start_date', ascending: false);
      final promos = data.map((json) => PromoModel.fromJson(json)).toList();
      return right(promos);
    } catch (e) {
      return left(SupabaseError('Failed to fetch promos'));
    }
  }
}
