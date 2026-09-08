import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        if (isFavorite) {
          showSnackBar(context, title: 'Added successfully to favorites');
        }
      },
      icon: isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
    );
  }
}
