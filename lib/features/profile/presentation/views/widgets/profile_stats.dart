import 'package:bookly/constants.dart';
import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/profile/presentation/view_models/stats_cubit/stats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatsCubit, StatsState>(
      listener: (context, state) {
        if (state is StatsFailure) {
          showSnackBar(context, title: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is StatsLoading) {
          return const CustomLoadingIndicator();
        }
        if (state is StatsSuccess) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.grey.shade100, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatItem(
                  value: state.stats.bookOrdered.toString(),
                  label: 'Books Ordered',
                  icon: Icons.menu_book_sharp,
                ),
                Container(width: 1, height: 44, color: Colors.grey.shade200),
                StatItem(
                  value: '\$${state.stats.totalSpent.toStringAsFixed(0)}',
                  label: 'Total Spent',
                  icon: Icons.payments_rounded,
                ),
                Container(width: 1, height: 44, color: Colors.grey.shade200),
                StatItem(
                  value: state.stats.memberSince.year.toString(),
                  label: 'Member Since',
                  icon: Icons.calendar_month_rounded,
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: kPrimaryColor, size: 24.sp),
        const SizedBox(height: 6),
        Text(
          value,
          style: Styles.textStyle16.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Styles.textStyle14.copyWith(
            color: kTextColor2,
            fontSize: 12.sp,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}
