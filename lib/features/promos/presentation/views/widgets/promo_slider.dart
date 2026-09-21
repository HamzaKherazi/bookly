import 'dart:async';
import 'package:bookly/features/promos/data/models/promo_model.dart';
import 'package:bookly/features/promos/presentation/views/widgets/promo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key, required this.promos});
  final List<PromoModel> promos;

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
      if (currentPage < widget.promos.length - 1) {
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
      height: 130.h,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.promos.length,
        onPageChanged: (index) {
          setState(() => currentPage = index);
        },
        itemBuilder: (context, index) {
          final scale = index == currentPage ? 1.0 : 0.92;

          return AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 300),
            child: PromoCard(promo: widget.promos[index]),
          );
        },
      ),
    );
  }
}
