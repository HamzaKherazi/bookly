import 'package:bookly/constants.dart';
import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/recommended_section.dart';
import 'package:bookly/features/promos/data/repos/promos_repo.dart';
import 'package:bookly/features/promos/presentation/view_models/promos_cubit/promos_cubit.dart';
import 'package:bookly/features/promos/presentation/views/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: BlocProvider(
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
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  RecommendedSection(),

                  const SizedBox(height: 40),

                  Text(
                    'New Arrivals',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: kTextColor1,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 16),
                  child: BookListViewItem(),
                );
              }, childCount: 10),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 70)),
          ],
        ),
      ),
    );
  }
}
