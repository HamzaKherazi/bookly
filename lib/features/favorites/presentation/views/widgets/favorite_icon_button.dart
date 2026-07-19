import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
