import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    'https://m.media-amazon.com/images/I/71bmxf4xUsL._AC_UF894,1000_QL80_.jpg',
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'The Sealed Nectar FJF FOJF OFJ FPFGKP¨GK PFIK F',
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kgTSectraFine,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 3),
                Text('Mubarakfuri', style: Styles.textStyle14),

                Row(
                  children: [
                    Text(
                      '19.99 \$',
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    BookRating(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookRating extends StatelessWidget {
  const BookRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star, color: const Color.fromARGB(255, 255, 221, 0)),
        ),
        Text('4.8', style: Styles.textStyle16),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('(2390)', style: Styles.textStyle14),
        ),
      ],
    );
  }
}
