// profile_view_body.dart
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProfileHeader(),
        SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                SizedBox(height: 12),

                _ProfileAvatar(name: 'Ahmed Mohamed', email: 'ahmed@email.com'),
                SizedBox(height: 28),
                _ProfileStats(
                  booksOrdered: 48,
                  totalSpent: 620.50,
                  memberSince: '2024',
                ),
                SizedBox(height: 32),
                _ProfileMenuSection(),
                SizedBox(height: 32),
                _SignOutButton(),
                SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ============= HEADER =============
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

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

// ============= AVATAR =============
class _ProfileAvatar extends StatelessWidget {
  final String name;
  final String email;

  const _ProfileAvatar({required this.name, required this.email});

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
          child: const Center(
            child: Icon(Icons.person, size: 56, color: Colors.white),
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

// ============= STATS =============
class _ProfileStats extends StatelessWidget {
  final int booksOrdered;
  final double totalSpent;
  final String memberSince;

  const _ProfileStats({
    required this.booksOrdered,
    required this.totalSpent,
    required this.memberSince,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatItem(
            value: booksOrdered.toString(),
            label: 'Books Ordered',
            icon: Icons.book_outlined,
          ),
          Container(width: 1, height: 44, color: Colors.grey.shade200),
          _StatItem(
            value: '\$${totalSpent.toStringAsFixed(0)}',
            label: 'Total Spent',
            icon: Icons.attach_money_outlined,
          ),
          Container(width: 1, height: 44, color: Colors.grey.shade200),
          _StatItem(
            value: memberSince,
            label: 'Member Since',
            icon: Icons.calendar_today_outlined,
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: kPrimaryColor.withOpacity(0.4), size: 18),
        const SizedBox(height: 6),
        Text(
          value,
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Styles.textStyle14.copyWith(
            color: kTextColor2,
            fontSize: 11,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

// ============= MENU SECTION =============
class _ProfileMenuSection extends StatelessWidget {
  const _ProfileMenuSection();

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
        children: const [
          _ProfileMenuItem(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            subtitle: 'Update your personal information',
          ),
          _ProfileDivider(),
          _ProfileMenuItem(
            icon: Icons.receipt_outlined,
            title: 'Order History',
            subtitle: 'View your past orders',
          ),
          _ProfileDivider(),
          _ProfileMenuItem(
            icon: Icons.bookmark_outline,
            title: 'Book Requests',
            subtitle: 'Request new books',
          ),
          _ProfileDivider(),
          _ProfileMenuItem(
            icon: Icons.lock_outline,
            title: 'Change Password',
            subtitle: 'Update your password',
          ),
          _ProfileDivider(),
          _ProfileMenuItem(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'App version 1.0.0',
          ),
        ],
      ),
    );
  }
}

class _ProfileDivider extends StatelessWidget {
  const _ProfileDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 16,
      endIndent: 16,
      color: Colors.grey.shade100,
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        splashColor: kPrimaryColor.withOpacity(0.05),
        highlightColor: kPrimaryColor.withOpacity(0.02),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: kPrimaryColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Styles.textStyle14.copyWith(
                        color: kTextColor2,
                        fontSize: 12,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============= SIGN OUT BUTTON =============
class _SignOutButton extends StatelessWidget {
  const _SignOutButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.red.shade200, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout_outlined,
                  color: Colors.red.shade600,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  'Sign Out',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.red.shade600,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
