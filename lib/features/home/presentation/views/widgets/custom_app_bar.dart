import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Assets.booklyLogo, height: 25),
          IconButton(
            highlightColor: Colors.transparent,
            onPressed: () {
              GoRouter.of(context).push(AppRouter.searchBookView);
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: kPrimaryColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
