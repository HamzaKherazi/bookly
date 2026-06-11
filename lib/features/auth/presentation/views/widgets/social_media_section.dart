import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/auth/presentation/views/widgets/social_media_button.dart';
import 'package:flutter/material.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaButton(
          assetName: Assets.googleIcon,
          title: 'Sign in with Google',
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        SocialMediaButton(
          assetName: Assets.appleIcon,
          title: 'Sign in with Apple',
          onPressed: () {},
        ),
      ],
    );
  }
}
