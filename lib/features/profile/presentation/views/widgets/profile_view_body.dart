// profile_view_body.dart
import 'package:bookly/features/profile/presentation/views/widgets/profile_avatar.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_menu_section.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_stats.dart';
import 'package:bookly/features/profile/presentation/views/widgets/sign_out_button.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeader(),
        SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                SizedBox(height: 12),

                ProfileAvatar(
                  name: 'Hamza Kherazi',
                  email: 'hamza.kherazi@email.com',
                ),
                SizedBox(height: 28),
                ProfileStats(
                  booksOrdered: 48,
                  totalSpent: 620.50,
                  memberSince: '2024',
                ),
                SizedBox(height: 32),
                ProfileMenuSection(),
                SizedBox(height: 32),
                SignOutButton(),
                SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
