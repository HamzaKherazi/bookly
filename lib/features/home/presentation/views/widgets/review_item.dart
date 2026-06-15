import 'package:bookly/constants.dart';
import 'package:bookly/features/home/presentation/views/widgets/customer_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      /// Main layout
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER (Avatar + Name + Rating stacked correctly)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(
                  'https://img.magnific.com/free-photo/full-shot-smiley-man-enjoying-nature_23-2149447458.jpg',
                ),
              ),

              const SizedBox(width: 12),

              /// Name + rating together (no hacks)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hamza Kherazi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Transform.translate(
                      offset: Offset(-16, 0),
                      child: CustomerRating(
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// Review text (aligned naturally under content)
          const Padding(
            padding: EdgeInsets.only(left: 60), // aligns with text start
            child: ExpandableText(
              text:
                  'review xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxSSSSx',
            ),
          ),
        ],
      ),
    );
  }
}
