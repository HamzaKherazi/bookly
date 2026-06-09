import 'package:bookly/features/auth/presentation/views/widgets/social_media_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaButton(icon: FontAwesomeIcons.google, onTap: () {}),
        const SizedBox(width: 16),
        SocialMediaButton(icon: FontAwesomeIcons.facebook, onTap: () {}),
        const SizedBox(width: 16),
        SocialMediaButton(icon: FontAwesomeIcons.apple, onTap: () {}),
      ],
    );
  }
}
