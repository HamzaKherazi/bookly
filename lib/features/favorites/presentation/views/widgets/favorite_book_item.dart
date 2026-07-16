import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteBookItem extends StatefulWidget {
  const FavoriteBookItem({super.key});

  @override
  State<FavoriteBookItem> createState() => _FavoriteBookItemState();
}

class _FavoriteBookItemState extends State<FavoriteBookItem> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: _isVisible ? 160 : 0,
        margin: _isVisible
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            : EdgeInsets.zero,
        child: _isVisible
            ? GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.bookDetailsView);
                },
                child: Container(
                  height: 160,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                      // Main content
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Book cover with modern styling
                            const BookCover(),
                            const SizedBox(width: 16),
                            // Book details
                            const Expanded(child: BookDetails()),
                          ],
                        ),
                      ),
                      // Favorite/Heart icon (already favorited)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: FavoriteIconButton(onRemove: _removeItem),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  void _removeItem() {
    setState(() {
      _isVisible = false;
    });
  }
}

class BookCover extends StatelessWidget {
  const BookCover({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 90,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://booksondemand.ma/cdn/shop/files/Atomic.png?v=1727078355&width=1100',
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.1)],
            ),
          ),
        ),
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Book title
        const BookTitle(),
        const SizedBox(height: 4),
        // Author name with icon
        const AuthorInfo(),
        const SizedBox(height: 8),
        // Rating and genre chips
        Row(
          children: [
            const RatingChip(),
            const SizedBox(width: 8),
            const CategoryChip(genre: 'Islamic'),
          ],
        ),
        const SizedBox(height: 14),
        // Price and action buttons
        const PriceTag(),
      ],
    );
  }
}

class BookTitle extends StatelessWidget {
  const BookTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'The Sealed Nectar',
      style: Styles.textStyle18.copyWith(
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1A1A2E),
        height: 1.3,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.person, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(
          'Mubarakfuri',
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
  const RatingChip({super.key});

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
            '4.8',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          Text(
            ' (124)',
            style: TextStyle(fontSize: 11, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String genre;

  const CategoryChip({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        genre,
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
  const PriceTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 226, 147, 43),
            Color.fromARGB(255, 118, 69, 6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        '\$19.99',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FavoriteIconButton extends StatelessWidget {
  final VoidCallback onRemove;

  const FavoriteIconButton({super.key, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Scale animation on tap
        onRemove();
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        duration: const Duration(milliseconds: 200),
        builder: (context, double scale, child) {
          return Transform.scale(
            scale: scale,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.favorite_rounded,
                size: 18,
                color: Color(0xFFFF4759),
              ),
            ),
          );
        },
      ),
    );
  }
}
