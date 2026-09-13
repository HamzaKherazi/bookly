import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/main_view.dart';
import 'package:bookly/features/promos/data/models/promo_model.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key, required this.promo});
  final PromoModel promo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 231, 188, 154),

        borderRadius: BorderRadius.circular(24),

        // 🌟 Glow shadow effect
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 231, 188, 154).withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Row(
          children: [
            // TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    promo.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: kTextColor1,
                    ),
                  ),
                  const SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainView(pageIndex: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      promo.buttonText,
                      style: TextStyle(fontFamily: 'Inter', fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // ILLUSTRATION
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.network(
                promo.imageUrl,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
