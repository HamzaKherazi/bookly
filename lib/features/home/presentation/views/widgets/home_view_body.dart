import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'books_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,

            child: BooksListView(),
          ),
          SizedBox(height: 60),
          Text('Best Seller', style: Styles.textStyle18),
          SizedBox(height: 30),
          BestSellerItem(),
        ],
      ),
    );
  }
}

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
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
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Sealed Nectar',
                style: TextStyle(
                  fontFamily: kgTSectraFine,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Mubarakfuri',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 207, 207, 207),
                ),
              ),
              Row(
                children: [
                  Text(
                    '19.99',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.star, color: Colors.white),
                  ),
                  Text(
                    '4.8',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('(2390)'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
