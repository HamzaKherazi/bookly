import 'package:bookly/features/searchBook/presentation/views/widgets/search_book_view_body.dart';
import 'package:flutter/material.dart';

class SearchBookView extends StatelessWidget {
  const SearchBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: SearchBookViewBody());
  }
}
