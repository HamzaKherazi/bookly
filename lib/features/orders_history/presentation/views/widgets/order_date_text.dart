import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/widgets.dart';

class OrderDateText extends StatelessWidget {
  const OrderDateText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Order Date: Dec 15, 2024',
      style: Styles.textStyle14.copyWith(color: kTextColor2),
    );
  }
}
