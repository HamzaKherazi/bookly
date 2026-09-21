import 'package:bookly/constants.dart';
import 'package:bookly/core/app_responsive/app_responsive.dart';
import 'package:bookly/core/models/book_preview_model.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookPreviewModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push('${AppRouter.bookDetailsView}/${book.bookId}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        height: AppResponsive.height(context) * 0.18,

        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: book.imageUrl == null
                  ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      child: Image.asset(kDefaultBookImage, fit: BoxFit.cover),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: book.imageUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Image.asset(kDefaultBookImage, fit: BoxFit.cover),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error, color: kPrimaryColor),
                      ),
                    ),
            ),
            SizedBox(width: 30.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.title,
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        height: 1.1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.author,
                    style: Styles.textStyle14.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),

                  // Category
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 241, 201),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      book.category,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 135, 98, 11),
                        fontFamily: 'Inter',
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        '${book.price} \$',
                        style: Styles.textStyle16.copyWith(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: BookRating(
                          avgRating: book.averageRating,
                          ratingCount: book.ratingCount,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
