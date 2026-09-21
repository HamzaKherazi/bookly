import 'package:bookly/core/app_responsive/app_responsive.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_preview_model.dart';
import 'package:bookly/core/widgets/book_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ExploreBookItem extends StatelessWidget {
  const ExploreBookItem({super.key, required this.book});
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
        padding: EdgeInsets.all(13.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(4, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Content (bottom section)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Badge
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
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 135, 98, 11),
                      fontFamily: 'Inter',
                      letterSpacing: 0.3,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: AppResponsive.height(context) * 0.012),

                // Book Title
                Text(
                  book.title,
                  style: Styles.textStyle14.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    height: 1.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),

                // Author
                Text(
                  book.author,
                  style: Styles.textStyle14.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),

                // Rating Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFC107),
                          size: 16.sp,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          book.averageRating.toStringAsFixed(1),
                          style: Styles.textStyle14.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          ' (${book.ratingCount})',
                          style: Styles.textStyle14.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),

                    Text(
                      '${book.price.toStringAsFixed(2)} \$',
                      style: Styles.textStyle14.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Book Cover Image (overlapping from top)
            Positioned(
              top: -60.h - AppResponsive.height(context) * 0.02,
              left: 20.w,
              right: 20.w,
              child: SizedBox(
                height: AppResponsive.height(context) * 0.173,
                child: BookCover(imgUrl: book.imageUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
