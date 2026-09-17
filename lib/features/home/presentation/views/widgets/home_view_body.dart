import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/promos_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/new_arrivals_section.dart';
import 'package:flutter/material.dart';

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
            SliverToBoxAdapter(child: PromosSection()),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  NewArrivalsSection(),

                  const SizedBox(height: 40),

                  Text(
                    'Best Seller',
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
            SliverToBoxAdapter(child: BestSelerListView()),
            SliverToBoxAdapter(child: SizedBox(height: 70)),
          ],
        ),
      ),
    );
  }
}
