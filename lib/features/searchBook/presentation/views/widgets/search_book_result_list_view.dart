import 'package:bookly/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            right: 20,
            left: 20,
          ),
          child: BookListViewItem(),
        );
      },
    );
  }
}
