import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/splash/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

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
          SizedBox(height: 20),
          BestSellerItem(),
        ],
      ),
    );
  }
}
