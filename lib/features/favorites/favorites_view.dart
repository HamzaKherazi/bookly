import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/favorites/presentation/views/widgets/favorite_book_item.dart';
import 'package:flutter/widgets.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Favorites', style: Styles.textStyle22),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return FavoriteBookItem();
            },
          ),
        ),
      ],
    );
  }
}
