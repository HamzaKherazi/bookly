import 'package:bookly/constants.dart';
import 'package:flutter/widgets.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: kTextColor1.withOpacity(0.08));
  }
}
