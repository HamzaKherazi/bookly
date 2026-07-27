import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final int booksOrdered;
  final double totalSpent;
  final String memberSince;

  const ProfileStats({
    super.key,
    required this.booksOrdered,
    required this.totalSpent,
    required this.memberSince,
  });

  @override
  Widget build(BuildContext context) {
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
            value: booksOrdered.toString(),
            label: 'Books Ordered',
            icon: Icons.menu_book_sharp,
          ),
          Container(width: 1, height: 44, color: Colors.grey.shade200),
          StatItem(
            value: '\$${totalSpent.toStringAsFixed(0)}',
            label: 'Total Spent',
            icon: Icons.payments_rounded,
          ),
          Container(width: 1, height: 44, color: Colors.grey.shade200),
          StatItem(
            value: memberSince,
            label: 'Member Since',
            icon: Icons.calendar_month_rounded,
          ),
        ],
      ),
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
        Icon(icon, color: kPrimaryColor, size: 24),
        const SizedBox(height: 6),
        Text(
          value,
          style: Styles.textStyle20.copyWith(
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
            fontSize: 11,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}
