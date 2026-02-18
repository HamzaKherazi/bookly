import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.logo),
        SizedBox(height: 6),
        Text(
          'Read free books',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
