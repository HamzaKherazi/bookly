import 'package:bookly/features/profile/presentation/views/widgets/order_date_text.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_status.dart';
import 'package:bookly/features/profile/presentation/views/widgets/timeline_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Timeline',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        const OrderDateText(),
        const SizedBox(height: 12),
        const TimelineSteps(),
      ],
    );
  }
}

class TimelineStep extends StatelessWidget {
  final String status;
  final bool isCompleted;
  final bool isCurrent;
  final bool isLast;
  final String currentStatus;

  const TimelineStep({
    super.key,
    required this.status,
    required this.isCompleted,
    required this.isCurrent,
    required this.isLast,
    required this.currentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? OrderStatus.getColor(currentStatus)
                    : Colors.grey[300],
                border: Border.all(
                  color: isCompleted
                      ? OrderStatus.getColor(currentStatus)
                      : Colors.grey[400]!,
                  width: 2,
                ),
              ),
              child: isCompleted
                  ? Icon(
                      status == currentStatus
                          ? Icons.check_circle
                          : Icons.check,
                      size: 14,
                      color: Colors.white,
                    )
                  : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 32,
                color: isCompleted
                    ? OrderStatus.getColor(currentStatus)
                    : Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  OrderStatus.getDisplayName(status),
                  style: TextStyle(
                    fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                    color: isCompleted ? Colors.black : Colors.grey[400],
                    fontSize: isCurrent ? 15 : 14,
                  ),
                ),
                if (isCurrent)
                  Text(
                    'Current status',
                    style: TextStyle(
                      fontSize: 12,
                      color: OrderStatus.getColor(currentStatus),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
