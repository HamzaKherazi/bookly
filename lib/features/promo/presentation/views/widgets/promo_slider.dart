import 'dart:async';
import 'package:bookly/features/promo/data/promo_data.dart';
import 'package:bookly/features/promo/presentation/views/widgets/promo_card.dart';
import 'package:flutter/material.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key,});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  final PageController _controller = PageController(viewportFraction: 0.85);
  int currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage < promos.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        controller: _controller,
        itemCount: promos.length,
        onPageChanged: (index) {
          setState(() => currentPage = index);
        },
        itemBuilder: (context, index) {
          final scale = index == currentPage ? 1.0 : 0.92;

          return AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 300),
            child: PromoCard(promo: promos[index],  ),
          );
        },
      ),
    );
  }
}
