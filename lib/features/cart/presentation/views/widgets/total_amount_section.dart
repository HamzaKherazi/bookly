import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TotalAmountSection extends StatelessWidget {
  const TotalAmountSection({super.key, required this.totalAmount});
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Amount',
            style: Styles.textStyle14.copyWith(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 241, 227),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Text(
                  '\$ ${totalAmount.toStringAsFixed(2)}',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w800,
                    color: kPrimaryColor,
                    fontSize: 18,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
        ],
      ),
    );
  }
}
