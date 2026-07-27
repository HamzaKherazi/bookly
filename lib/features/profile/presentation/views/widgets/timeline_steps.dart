import 'package:bookly/features/profile/presentation/views/widgets/order_status.dart';
import 'package:bookly/features/profile/presentation/views/widgets/order_timeline.dart';
import 'package:flutter/widgets.dart';

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

    final currentStatus = OrderStatus.delivered;
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
