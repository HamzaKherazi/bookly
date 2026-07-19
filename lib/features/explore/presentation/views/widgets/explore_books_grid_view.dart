import 'package:bookly/features/explore/presentation/views/widgets/explore_book_item.dart';
import 'package:flutter/widgets.dart';

class ExploreBooksGridView extends StatelessWidget {
  const ExploreBooksGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 50),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 60,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ExploreBookItem();
      },
    );
  }
}
