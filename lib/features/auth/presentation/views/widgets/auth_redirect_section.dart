import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class AuthRedirectSection extends StatelessWidget {
  const AuthRedirectSection({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onPressed,
  });

  final String questionText;
  final String actionText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText, style: TextStyle(color: Colors.grey.shade700)),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(overlayColor: Colors.transparent),
          child: Text(
            actionText,
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
