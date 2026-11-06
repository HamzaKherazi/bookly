import 'package:bookly/constants.dart';
import 'package:bookly/core/app_responsive/app_responsive.dart';
import 'package:bookly/core/models/book_preview_model.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/book_cover.dart';
import 'package:bookly/core/widgets/shatter_widget.dart';
import 'package:bookly/features/book_details/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/favorites/presentation/view_models/cubit/favorites_cubit.dart';
import 'package:bookly/features/favorites/presentation/views/widgets/favorite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoriteBookItem extends StatefulWidget {
  const FavoriteBookItem({super.key, required this.bookPreviewModel});

  final BookPreviewModel bookPreviewModel;

  @override
  State<FavoriteBookItem> createState() => _FavoriteBookItemState();
}

class _FavoriteBookItemState extends State<FavoriteBookItem>
    with SingleTickerProviderStateMixin {
  final _shatterKey = GlobalKey<ShatterWidgetState>();
  late final AnimationController _collapseController;
  late final Animation<double> _size;

  @override
  void initState() {
    super.initState();
    _collapseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _size = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _collapseController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _collapseController.dispose();
    super.dispose();
  }

  // Heart tapped -> explode the card.
  void _removeItem() => _shatterKey.currentState?.shatter();

  // Pieces are gone -> close the gap, then remove from the cubit.
  Future<void> _onShattered() async {
    await _collapseController.forward();
    if (!mounted) return;
    BlocProvider.of<FavoritesCubit>(
      context,
    ).removeFavorite(bookId: widget.bookPreviewModel.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _size,
      axisAlignment: -1,
      child: ShatterWidget(
        key: _shatterKey,
        onCompleted: _onShattered,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.bookDetailsView,
                extra: widget.bookPreviewModel.bookId,
              );
            },
            child: Container(
              height: AppResponsive.height(context) * 0.175,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BookCover(imgUrl: widget.bookPreviewModel.imageUrl),
                        const SizedBox(width: 16),
                        Expanded(
                          child: BookDetails(
                            bookPreviewModel: widget.bookPreviewModel,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: FavoriteIconButton(onRemove: _removeItem),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.bookPreviewModel});
  final BookPreviewModel bookPreviewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Book title
        BookTitle(title: bookPreviewModel.title),
        const SizedBox(height: 4),
        // Author name with icon
        AuthorInfo(author: bookPreviewModel.author),
        const SizedBox(height: 8),
        // Rating and genre chips
        Row(
          children: [
            RatingChip(
              bookRating: BookRating(
                avgRating: bookPreviewModel.averageRating,
                ratingCount: bookPreviewModel.ratingCount,
              ),
            ),
            const SizedBox(width: 8),
            CategoryChip(category: bookPreviewModel.category),
          ],
        ),
        const SizedBox(height: 14),
        // Price and action buttons
        PriceTag(price: bookPreviewModel.price),
      ],
    );
  }
}

class BookTitle extends StatelessWidget {
  const BookTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Styles.textStyle18.copyWith(
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1A1A2E),
        height: 1.3,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({super.key, required this.author});

  final String author;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.person, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          author,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class RatingChip extends StatelessWidget {
  const RatingChip({super.key, required this.bookRating});
  final BookRating bookRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, size: 14, color: Color(0xFFFFB300)),
          const SizedBox(width: 2),
          Text(
            bookRating.avgRating.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          Text(
            ' (${bookRating.ratingCount})',
            style: TextStyle(fontSize: 11, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Colors.blue[700],
        ),
      ),
    );
  }
}

class PriceTag extends StatelessWidget {
  const PriceTag({super.key, required this.price});
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 252, 215),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '\$${price.toStringAsFixed(2)}',
        style: Styles.textStyle14.copyWith(fontSize: 12, color: Colors.black),
      ),
    );
  }
}
