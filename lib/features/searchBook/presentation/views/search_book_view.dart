import 'package:bookly/features/searchBook/presentation/views/widgets/search_book_view_body.dart';
import 'package:flutter/material.dart';

class SearchBookView extends StatelessWidget {
  const SearchBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SearchBookViewBody()));
  }
}
