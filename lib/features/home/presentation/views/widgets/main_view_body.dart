import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/favorites_view.dart';
import 'package:bookly/features/home/presentation/views/library_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view.dart';
import 'package:bookly/features/profile/presentation/views/profile_view.dart';
import 'package:bookly/features/shop/presentation/views/cart_view.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const FavoritesView(),
    const LibraryView(),
    const CartView(),
    const ProfileView(),
  ];

  late final NotchBottomBarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NotchBottomBarController(index: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _pages[_currentIndex],

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CustomNavigationBottomBar(
            notchBottomBarController: _controller,
            color: kPrimaryColor, //bottom bar background color
            notchColor: kPrimaryColor,
            showLabel: false,
            showShadow: true,
            shadowElevation: 12,
            bottomBarHeight: 70,
            kBottomRadius: 32,
            kIconSize: 24,

            bottomBarItems: [
              BottomBarItem(
                inActiveItem: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                activeItem: const Icon(Icons.home_rounded, color: Colors.white),
              ),
              BottomBarItem(
                inActiveItem: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                activeItem: const Icon(Icons.favorite, color: Colors.white),
              ),
              BottomBarItem(
                inActiveItem: const Icon(
                  Icons.menu_book_outlined,
                  color: Colors.white,
                ),
                activeItem: const Icon(Icons.menu_book, color: Colors.white),
              ),
              BottomBarItem(
                inActiveItem: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                activeItem: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              BottomBarItem(
                inActiveItem: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
                activeItem: const Icon(Icons.person, color: Colors.white),
              ),
            ],

            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });

              _controller.jumpTo(index);
            },
          ),
        ),
      ],
    );
  }
}
