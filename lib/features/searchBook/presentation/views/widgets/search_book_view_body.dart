import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/searchBook/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/features/searchBook/presentation/views/widgets/search_book_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchBookViewBody extends StatelessWidget {
  const SearchBookViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomSearchTextField(),
        ),

        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Search results',
              style: Styles.textStyle18.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: 16),

        Expanded(child: SearchResultListView()),
      ],
    );
  }
}
