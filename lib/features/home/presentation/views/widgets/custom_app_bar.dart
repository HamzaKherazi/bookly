import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Assets.booklyLogo, height: 22.h),
          IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.notificationsView);
            },
            icon: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(Icons.notifications, color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
