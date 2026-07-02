import 'package:flutter/material.dart';

class TrustBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const TrustBadge({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: Colors.grey.shade400),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
