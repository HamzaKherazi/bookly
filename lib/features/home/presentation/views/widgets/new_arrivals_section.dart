import 'package:bookly/constants.dart';
import 'package:bookly/core/app_responsive/app_responsive.dart';
import 'package:bookly/features/home/presentation/views/widgets/new_arrivals_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'New Arrivals',
          style: TextStyle(
            fontSize: 17.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: kTextColor1,
          ),
        ),
        SizedBox(height: AppResponsive.height(context) * 0.02),
        SizedBox(
          height: AppResponsive.height(context) * 0.24,

          child: NewArrivalsListView(),
        ),
      ],
    );
  }
}
