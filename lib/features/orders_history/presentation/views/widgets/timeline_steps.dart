import 'package:bookly/features/orders_history/presentation/views/widgets/order_status.dart';
import 'package:flutter/material.dart';

class TimelineSteps extends StatelessWidget {
  const TimelineSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final statuses = [
      OrderStatus.pending,
      OrderStatus.processing,
      OrderStatus.shipped,
      OrderStatus.delivered,
    ];

    final currentStatus = OrderStatus.processing;
    final currentStatusIndex = statuses.indexOf(currentStatus);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: statuses.asMap().entries.map((entry) {
          final index = entry.key;
          final status = entry.value;
          final isCompleted = index <= currentStatusIndex;
          final isCurrent = status == currentStatus;
          final isLast = index == statuses.length - 1;

          return TimelineStep(
            status: status,
            isCompleted: isCompleted,
            isCurrent: isCurrent,
            isLast: isLast,
            currentStatus: currentStatus,
          );
        }).toList(),
      ),
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
                  status,
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
