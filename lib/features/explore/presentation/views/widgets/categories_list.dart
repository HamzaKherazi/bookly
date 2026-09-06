import 'package:bookly/features/explore/presentation/view_models/categories_cubit/categories_cubit.dart';
import 'package:bookly/features/explore/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  final int selectedIndex;
  final Function(int)
  onCategorySelected; // Fixed: Changed from VoidCallback to Function(int)

  const CategoriesList({
    super.key,
    required this.selectedIndex,
    required this.onCategorySelected, // Fixed: renamed for clarity
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CategoryItem(
                  category: state.categories[index],
                  isSelected: selectedIndex == index,
                  onTap: () => onCategorySelected(index),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
      listener: (context, state) {
        if (state is CategoriesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }
}
