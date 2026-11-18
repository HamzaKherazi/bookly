import 'package:bookly/core/helpers/show_dialog.dart';
import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/book_request/data/repos/request_repo.dart';
import 'package:bookly/features/book_request/presentation/view_models/request_cubit/request_cubit.dart';
import 'package:bookly/features/book_request/presentation/views/functions/submit_request.dart';
import 'package:bookly/features/book_request/presentation/views/widgets/custom_text_form_field.dart';
import 'package:bookly/features/book_request/presentation/views/widgets/info_container.dart';
import 'package:bookly/features/book_request/presentation/views/widgets/request_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookRequestViewBody extends StatefulWidget {
  const BookRequestViewBody({super.key});

  @override
  State<BookRequestViewBody> createState() => _BookRequestViewBodyState();
}

class _BookRequestViewBodyState extends State<BookRequestViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    const RequestHeader(),
                    const SizedBox(height: 32),

                    // Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Book Title Field
                          CustomTextFormField(
                            controller: _titleController,
                            label: 'Book Title',
                            hint: 'e.g., The Great Gatsby',
                            icon: Icons.book_outlined,
                          ),
                          const SizedBox(height: 20),

                          // Author Field
                          CustomTextFormField(
                            controller: _authorController,
                            label: 'Author',
                            hint: 'e.g., F. Scott Fitzgerald',
                            icon: Icons.person_outline,
                            textInputAction: TextInputAction.done,
                          ),
                          const SizedBox(height: 32),

                          // Submit Button
                          SizedBox(
                            height: 50,
                            child: BlocProvider(
                              create: (context) =>
                                  RequestCubit(getIt.get<RequestRepo>()),
                              child: BlocConsumer<RequestCubit, RequestState>(
                                listener: (context, state) {
                                  if (state is RequestSuccess) {
                                    showCustomDialog(
                                      context,
                                      title: 'Book Request',
                                      message:
                                          'Request submitted successfully!',
                                    );
                                  } else if (state is RequestFailure) {
                                    showSnackBar(
                                      context,
                                      title: 'Failed to submit request',
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        177,
                                        2,
                                        2,
                                      ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  if (state is RequestLoading) {
                                    return const Center(
                                      child: CustomLoadingIndicator(),
                                    );
                                  }
                                  return CustomButton(
                                    onPressed: () {
                                      if (!_formKey.currentState!.validate()) {
                                        return;
                                      }
                                      submitRequest(
                                        context: context,
                                        formKey: _formKey,
                                        titleController: _titleController,
                                        authorController: _authorController,
                                      );
                                    },
                                    title: 'Submit Request',
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Spacer pushes content up and info container down
                    const Spacer(),

                    // Info container - now sticky at bottom!
                    InfoContainer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
