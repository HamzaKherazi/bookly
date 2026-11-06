import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/favorites/presentation/views/widgets/favorites_view_body.dart';
import 'package:flutter/widgets.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //App Bar
        Text(
          'Favorites',
          style: Styles.textStyle22.copyWith(color: kPrimaryColor),
        ),
        SizedBox(height: 20),
        //Body
        FavoritesViewBody(),
      ],
    );
  }
}
