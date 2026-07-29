import 'package:bookly/features/orders_history/presentation/views/widgets/status_filter_bar_item.dart';
import 'package:flutter/material.dart';

class StatusFilterBar extends StatefulWidget {
  const StatusFilterBar({super.key});

  @override
  State<StatusFilterBar> createState() => _StatusFilterBarState();
}

class _StatusFilterBarState extends State<StatusFilterBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: statuses.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final status = statuses[index];
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: StatusFilterBarItem(label: status, isSelected: isSelected),
          );
        },
      ),
    );
  }
}

const List<String> statuses = [
  'All',
  'Pending',
  'Processing',
  'Shipped',
  'Delivered',
  'Cancelled',
];
