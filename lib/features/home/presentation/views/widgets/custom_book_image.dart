import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: Image.network(
              'https://m.media-amazon.com/images/I/71bmxf4xUsL._AC_UF894,1000_QL80_.jpg',
            ).image,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
