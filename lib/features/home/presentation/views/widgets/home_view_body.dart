import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/recommended_section.dart';
import 'package:bookly/features/promo/presentation/views/widgets/promo_slider.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: PromoSlider()),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  RecommendedSection(),

                  const SizedBox(height: 40),

                  Text(
                    'New Arrivals',
                    style: Styles.textStyle18.copyWith(color: kTextColor1),
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
          ],
        ),
      ),
    );
  }
}
