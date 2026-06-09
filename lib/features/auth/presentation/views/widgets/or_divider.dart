import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text("OR", style: TextStyle(color: Colors.grey.shade600)),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300)),
      ],
    );
  }
}
