import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/explore/presentation/views/widgets/categories_list.dart';
import 'package:bookly/features/explore/presentation/views/widgets/explore_books_grid_view.dart';
import 'package:bookly/features/explore/presentation/views/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  late List<String> categories;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    categories = [
      'All',
      'Islamic',
      'Fiction',
      'Non-Fiction',
      'Science',
      'History',
      'Biography',
      'Self-Help',
    ];
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
        const SearchBarWithBorder(),
        const SizedBox(height: 16),

        // Categories List
        SizedBox(
          height: 40,
          child: CategoriesList(
            categories: categories,
            selectedIndex: _selectedIndex,
            onCategorySelected: _selectCategory,
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
      ],
    );
  }
}

