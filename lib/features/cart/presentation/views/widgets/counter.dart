import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              counter = (counter - 1).clamp(1, 99);
            });
          },
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          icon: Icon(Icons.remove, size: 20, color: Colors.black54),
        ),

        const SizedBox(width: 4),

        SizedBox(
          width: 28,
          child: Text(
            textAlign: TextAlign.center,
            counter.toString(),
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(width: 4),
        IconButton(
          onPressed: () {
            setState(() {
              counter = (counter + 1).clamp(1, 99);
            });
          },
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          icon: Icon(Icons.add, size: 20, color: kPrimaryColor),
        ),
      ],
    );
  }
}
