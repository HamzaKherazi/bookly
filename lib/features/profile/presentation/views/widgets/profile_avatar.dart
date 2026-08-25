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
              ktestProfileImage,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return ClipOval(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: kBackgroundColor,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: kPrimaryColor,
                    ),
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return ClipOval(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: kPrimaryColor,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                );
              },
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
