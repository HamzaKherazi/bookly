import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TrackingInfoDialog extends StatelessWidget {
  const TrackingInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tracking Information'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tracking Number:'),
          const SizedBox(height: 4),
          const Text(
            '1Z999AA10123456784',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          const Text('Current Status: In Transit'),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.grey[200],
            color: kPrimaryColor,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipped', style: Styles.textStyle14.copyWith(fontSize: 12)),
              Text(
                'Delivering',
                style: Styles.textStyle14.copyWith(fontSize: 12),
              ),
              Text(
                'Delivered',
                style: Styles.textStyle14.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
