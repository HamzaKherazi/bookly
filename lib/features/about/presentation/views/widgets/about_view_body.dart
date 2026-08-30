import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AboutViewBody extends StatelessWidget {
  const AboutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // App Logo
                    _LogoSection(),
                    // App Name and Version
                    _AppInfoSection(),
                    SizedBox(height: 32),

                    // Description
                    _DescriptionSection(),
                    SizedBox(height: 24),

                    // Key Features
                    _FeaturesSection(),
                    SizedBox(height: 24),

                    // Statistics
                    _StatisticsSection(),
                    SizedBox(height: 24),

                    // Social & Contact
                    _SocialSection(),
                    SizedBox(height: 24),

                    // Footer
                    _FooterSection(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _AppInfoSection extends StatelessWidget {
  const _AppInfoSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Version 1.0.0',
        style: Styles.textStyle14.copyWith(color: Colors.grey[500]),
      ),
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: kPrimaryColor, size: 22),
              const SizedBox(width: 12),
              Text(
                'About the App',
                style: Styles.textStyle18.copyWith(color: Colors.grey[800]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Bookly is a modern book store app designed to help you '
            'discover, browse, and purchase books from a vast collection. '
            'Find your next favorite book, explore new genres, and enjoy '
            'a seamless shopping experience.',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.grey[700],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star_outline, color: kPrimaryColor, size: 22),
              const SizedBox(width: 12),
              Text(
                'Key Features',
                style: Styles.textStyle18.copyWith(color: Colors.grey[800]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _FeatureItem(
            icon: Icons.search,
            title: 'Browse Books',
            subtitle: 'Search through thousands of titles',
          ),
          _FeatureItem(
            icon: Icons.shopping_bag,
            title: 'Easy Purchase',
            subtitle: 'Buy books with a few taps',
          ),
          _FeatureItem(
            icon: Icons.favorite,
            title: 'Wishlist',
            subtitle: 'Save books for later',
          ),
          _FeatureItem(
            icon: Icons.star,
            title: 'Reviews & Ratings',
            subtitle: 'Read and share book reviews',
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: kPrimaryColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.textStyle16.copyWith(color: Colors.grey[800]),
                ),
                Text(
                  subtitle,
                  style: Styles.textStyle14.copyWith(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatisticsSection extends StatelessWidget {
  const _StatisticsSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _StatCard(
            number: '10K+',
            label: 'Books Available',
            icon: Icons.library_books,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            number: '5K+',
            label: 'Happy Customers',
            icon: Icons.people,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Icon(icon, color: kPrimaryColor, size: 28),
          const SizedBox(height: 8),
          Text(
            number,
            style: Styles.textStyle22.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: Styles.textStyle14.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SocialSection extends StatelessWidget {
  const _SocialSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.people_outline, color: kPrimaryColor, size: 22),
              const SizedBox(width: 12),
              Text(
                'Connect With Us',
                style: Styles.textStyle18.copyWith(color: Colors.grey[800]),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _SocialButton(
                icon: Icons.email,
                label: 'Email',
                url: 'mailto:support@bookly.com',
              ),
              _SocialButton(
                icon: Icons.public,
                label: 'Website',
                url: 'https://bookly.com',
              ),
              _SocialButton(
                icon: Icons.help_outline,
                label: 'Support',
                url: 'https://bookly.com/support',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: Implement URL launching
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Opening $label...'),
            backgroundColor: kPrimaryColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: kPrimaryColor, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Styles.textStyle14.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Made with ❤️ by the Bookly Team',
            style: Styles.textStyle14.copyWith(
              color: Colors.grey[500],
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '© 2024 Bookly. All rights reserved.',
            style: Styles.textStyle14.copyWith(
              color: Colors.grey[400],
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
