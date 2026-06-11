import 'dart:ui';

import 'package:bookly/features/promo/presentation/view_models/promo.dart';

final promos = [
  Promo(
    title: "Fast Delivery",
    subtitle: "Get your books in 24 hours",
    buttonText: "Explore",
    color: const Color.fromARGB(255, 231, 188, 154),
    svgAsset: "assets/illustrations/delivery.svg",
  ),
  Promo(
    title: "Big Discounts",
    subtitle: "Up to 50% off bestsellers",
    buttonText: "Explore",
    color: const Color.fromARGB(255, 219, 214, 210),
    svgAsset: "assets/illustrations/discount.svg",
  ),
  Promo(
    title: "Discover Books",
    subtitle: "Find your next favorite read",
    buttonText: "Explore",
    color: const Color.fromARGB(255, 187, 234, 230),
    svgAsset: "assets/illustrations/book.svg",
  ),
];
