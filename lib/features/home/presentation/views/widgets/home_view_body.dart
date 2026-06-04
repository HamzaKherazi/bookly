import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:bookly/features/splash/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

import 'books_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: const CustomAppBar(),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                        
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                        
                      child: BooksListView(),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: const Text('Best Seller', style: Styles.textStyle18),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              SliverFillRemaining(child: BestSellerListView()),
            ],
          ),
        ),
      ],
    );
  }
}
