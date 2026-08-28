import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_divider.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100, width: 1),
      ),
      child: Column(
        children: [
          ProfileMenuItem(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            subtitle: 'Update your personal information',
            onTap: () {
              GoRouter.of(context).push(AppRouter.editProfileView);
            },
          ),
          ProfileDivider(),
          ProfileMenuItem(
            icon: Icons.receipt_outlined,
            title: 'Order History',
            subtitle: 'View your past orders',
            onTap: () {
              GoRouter.of(context).push(AppRouter.orderHistoryView);
            },
          ),
          ProfileDivider(),
          ProfileMenuItem(
            icon: Icons.bookmark_outline,
            title: 'Book Requests',
            subtitle: 'Request new books',
            onTap: () {
              GoRouter.of(context).push(AppRouter.bookRequestView);
            },
          ),
          ProfileDivider(),
          ProfileMenuItem(
            icon: Icons.lock_outline,
            title: 'Change Password',
            subtitle: 'Update your password',
            onTap: () {
              GoRouter.of(context).push(AppRouter.changePasswordView);
            },
          ),
          ProfileDivider(),
          ProfileMenuItem(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'App version 1.0.0',
            onTap: () {
              GoRouter.of(context).push(AppRouter.aboutView);
            },
          ),
        ],
      ),
    );
  }
}
