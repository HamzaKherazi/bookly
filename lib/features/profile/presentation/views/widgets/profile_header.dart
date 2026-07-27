import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: AlignmentGeometry.center,
        child: const Text('Profile', style: Styles.textStyle22),
      ),
    );
  }
}
