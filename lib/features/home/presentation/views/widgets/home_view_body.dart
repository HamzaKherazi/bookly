import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_list_view.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.27,

                    child: BooksListView(),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Best Seller',
                    style: Styles.textStyle18.copyWith(color: kPrimaryColor),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 20,
                  ),
                  child: BookListViewItem(),
                );
              }, childCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
