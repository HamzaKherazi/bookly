import 'dart:async';

import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/explore/presentation/view_models/books_cubit/books_cubit.dart';
import 'package:bookly/features/explore/presentation/views/widgets/categories_list.dart';
import 'package:bookly/features/explore/presentation/views/widgets/explore_books_grid_view.dart';
import 'package:bookly/features/explore/presentation/views/widgets/search_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.center,
            child: Text('Explore', style: Styles.textStyle22),
          ),
        ),
        const SizedBox(height: 16),

        // Search Bar
        SearchBarWithBorder(
          onChanged: (search) {
            _debounce?.cancel();

            _debounce = Timer(const Duration(milliseconds: 500), () {
              BlocProvider.of<BooksCubit>(context).searchBooks(search);
            });
          },
        ),
        const SizedBox(height: 16),

        // Categories List
        SizedBox(
          height: 40,
          child: CategoriesList(
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
        const SizedBox(height: 20),

        // Books Grid
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ExploreBooksGridView(),
          ),
        ),
        const SizedBox(height: 70),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
