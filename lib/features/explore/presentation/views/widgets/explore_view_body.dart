import 'dart:async';

import 'package:bookly/constants.dart';
import 'package:bookly/core/app_responsive/app_responsive.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/explore/presentation/view_models/books_cubit/books_cubit.dart';
import 'package:bookly/features/explore/presentation/view_models/categories_cubit/categories_cubit.dart';
import 'package:bookly/features/explore/presentation/views/widgets/categories_list_view.dart';
import 'package:bookly/features/explore/presentation/views/widgets/explore_books_grid_view.dart';
import 'package:bookly/features/explore/presentation/views/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreViewBody extends StatefulWidget {
  const ExploreViewBody({super.key});

  @override
  State<ExploreViewBody> createState() => _ExploreViewBodyState();
}

class _ExploreViewBodyState extends State<ExploreViewBody> {
  int _selectedIndex = 0;
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
  }

  void _selectCategory(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Explore',
              style: Styles.textStyle22.copyWith(color: kPrimaryColor),
            ),
          ),
        ),
        SizedBox(height: AppResponsive.height(context) * 0.02),

        // Search Bar
        SearchBarWithBorder(
          onChanged: (search) {
            _debounce?.cancel();

            _debounce = Timer(const Duration(milliseconds: 500), () {
              BlocProvider.of<BooksCubit>(context).searchBooks(search);
            });
          },
        ),
        SizedBox(height: AppResponsive.height(context) * 0.02),

        // Categories List
        SizedBox(
          height: 40.h,
          child: CategoriesListView(
            selectedIndex: _selectedIndex,
            onCategorySelected: _selectCategory,
            filterByCategory: (categoryId) {
              if (categoryId == -1) {
                BlocProvider.of<BooksCubit>(context).getAllBooks();
                return;
              }
              BlocProvider.of<BooksCubit>(
                context,
              ).getBooksByCategory(categoryId);
            },
          ),
        ),
        SizedBox(height: AppResponsive.height(context) * 0.02),

        // Books Grid
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: RefreshIndicator(
              color: kPrimaryColor,
              backgroundColor: kWhite,
              onRefresh: () async {
                Future.wait([
                  BlocProvider.of<BooksCubit>(context).getAllBooks(),
                  BlocProvider.of<CategoriesCubit>(context).getAllCategories(),
                ]);
              },
              child: ExploreBooksGridView(),
            ),
          ),
        ),
        SizedBox(height: 70.h),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }
}
