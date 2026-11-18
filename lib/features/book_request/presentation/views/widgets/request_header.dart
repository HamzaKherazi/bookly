import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestHeader extends StatelessWidget {
  const RequestHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          'Request a Book',
          style: Styles.textStyle24.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Fill in the details below to submit your book request',
          style: Styles.textStyle16.copyWith(
            fontSize: 14.sp,

            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
