import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/cart/presentation/views/cart_view.dart';
import 'package:bookly/features/explore/data/repos/explore_repo.dart';
import 'package:bookly/features/explore/presentation/view_models/categories_cubit/categories_cubit.dart';
import 'package:bookly/features/favorites/favorites_view.dart';
import 'package:bookly/features/explore/presentation/views/explore_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view.dart';
import 'package:bookly/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  late int _currentIndex;
  late final NotchBottomBarController _controller;

  final List<Widget> _pages = [
    const HomeView(),
    const FavoritesView(),
    const ExploreView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = NotchBottomBarController(index: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(getIt.get<ExploreRepo>()),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              IndexedStack(index: _currentIndex, children: _pages),
          
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
                  bottomBarHeight: 60,
                  kBottomRadius: 24,
                  kIconSize: 24,
          
                  bottomBarItems: [
                    BottomBarItem(
                      inActiveItem: const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      activeItem: const Icon(
                        Icons.home_rounded,
                        color: Colors.white,
                      ),
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
                    if (index == 3) {
                      GoRouter.of(context).push(AppRouter.cartView);
                      return;
                    }
                    if (index == 2) {
                      BlocProvider.of<CategoriesCubit>(context).getAllCategories();
                    }
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
      ),
    );
  }
}
