import 'package:bookly/features/explore/presentation/views/widgets/category_item.dart';
import 'package:flutter/widgets.dart';

class CategoriesList extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int)
  onCategorySelected; // Fixed: Changed from VoidCallback to Function(int)

  const CategoriesList({
    Key? key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected, // Fixed: renamed for clarity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CategoryItem(
            category: categories[index],
            isSelected: selectedIndex == index,
            onTap: () => onCategorySelected(index),
          ),
        );
      },
    );
  }
}
