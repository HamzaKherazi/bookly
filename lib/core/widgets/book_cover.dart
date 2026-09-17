import 'package:bookly/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({super.key, required this.imgUrl});
  final String? imgUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: imgUrl == null
            ? Image.asset(kDefaultBookImage, fit: BoxFit.cover)
            : CachedNetworkImage(
                imageUrl: imgUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Image.asset(kDefaultBookImage, fit: BoxFit.cover),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: kPrimaryColor),
              ),
      ),
    );
  }
}
