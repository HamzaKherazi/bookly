import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/widgets.dart';

class HeaderSection extends StatelessWidget {
  final String title;

  const HeaderSection(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyle16.copyWith(
            color: kTextColor1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
