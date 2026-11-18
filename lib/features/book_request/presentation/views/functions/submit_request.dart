import 'package:bookly/features/book_request/data/models/request_model.dart';
import 'package:bookly/features/book_request/presentation/view_models/request_cubit/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void submitRequest({
  required BuildContext context,
  required GlobalKey<FormState> formKey,
  required TextEditingController titleController,
  required TextEditingController authorController,
}) {
  final bookTitle = titleController.text.trim();
  final bookAuthor = authorController.text.trim();

  BlocProvider.of<RequestCubit>(context).addRequest(
    request: RequestModel(bookTitle: bookTitle, authorName: bookAuthor),
  );

  titleController.clear();
  authorController.clear();
}
