import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView);
      },
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12),

          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 79, 45, 0).withOpacity(0.2),
              blurRadius: 16,
              offset: Offset(0, 6), // 👈 bottom shadow
            ),
          ],
        ),

        height: 135,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: Image.network(
                      'https://www.leadstartcorp.com/leadstart/wp-content/uploads/2024/12/How-To-Win-Friends-Influence-People-Front-Cover-768x1234.jpg',
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      'The Sealed Nectar FJF FOJF OFJ FPFGKP¨GK PFIK F',
                      style: Styles.textStyle18.copyWith(
                        fontFamily: kgTSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text('Mubarakfuri', style: Styles.textStyle16),

                  Row(
                    children: [
                      Text('19.99 \$', style: Styles.textStyle16),
                      Spacer(),
                      BookRating(),
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
