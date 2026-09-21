import 'package:bookly/constants.dart';
import 'package:bookly/core/app_responsive/app_responsive.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/promos_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/new_arrivals_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 16.h),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: PromosSection()),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppResponsive.height(context) * 0.04),

                  NewArrivalsSection(),

                  SizedBox(height: AppResponsive.height(context) * 0.04),

                  Text(
                    'Best Seller',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: kTextColor1,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            SliverToBoxAdapter(child: BestSellerListView()),
            SliverToBoxAdapter(
              child: SizedBox(height: AppResponsive.height(context) * 0.11),
            ),
          ],
        ),
      ),
    );
  }
}
