import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  final String email;

  const ProfileAvatar({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [kPrimaryColor, kPrimaryColor.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.3),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.network(
              'https://media.licdn.com/dms/image/v2/D4E03AQH7CysXZr29_A/profile-displayphoto-crop_800_800/B4EZ7Qo_dbJkAM-/0/1781616869558?e=1785974400&v=beta&t=mfWu2wyPVQN4NRdcQPXNE7yIaNIkrU8iSpCtRSYarNQ',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          name,
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: Styles.textStyle14.copyWith(
            color: kTextColor2,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}
