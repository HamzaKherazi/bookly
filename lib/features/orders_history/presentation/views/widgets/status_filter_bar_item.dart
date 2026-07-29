import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class StatusFilterBarItem extends StatelessWidget {
  final String label;
  final bool isSelected;

  const StatusFilterBarItem({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? kPrimaryColor : kWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? kPrimaryColor : kTextColor2.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: Styles.textStyle14.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? kWhite : kTextColor2,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
