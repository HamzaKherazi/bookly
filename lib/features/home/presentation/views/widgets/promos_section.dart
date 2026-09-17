import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/promos/data/repos/promos_repo.dart';
import 'package:bookly/features/promos/presentation/view_models/promos_cubit/promos_cubit.dart';
import 'package:bookly/features/promos/presentation/views/widgets/promo_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromosSection extends StatelessWidget {
  const PromosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
                create: (context) =>
                    PromosCubit(getIt.get<PromosRepo>())..getAllPromos(),
                child: BlocConsumer<PromosCubit, PromosState>(
                  builder: (context, state) {
                    if (state is PromosSuccess) {
                      return PromoSlider(promos: state.promos);
                    } else if (state is PromosLoading) {
                      return CustomLoadingIndicator();
                    }
                    return const SizedBox.shrink();
                  },
                  listener: (context, state) {
                    if (state is PromosError) {
                      showSnackBar(context, title: state.errMessage);
                    }
                  },
                ),
              );
  }
}