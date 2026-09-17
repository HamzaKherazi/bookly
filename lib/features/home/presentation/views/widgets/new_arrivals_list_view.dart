import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/home/presentation/view_models/new_arrivals_cubit/new_arrivals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/book_cover_button.dart';

class NewArrivalsListView extends StatelessWidget {
  const NewArrivalsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewArrivalsCubit(getIt.get<HomeRepo>())..getNewArrivals(),
      child: BlocConsumer<NewArrivalsCubit, NewArrivalsState>(
        builder: (context, state) {
          if (state is NewArrivalsSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.newArrivals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: BookCoverButton(
                    bookId: state.newArrivals[index].bookId,
                    imgUrl: state.newArrivals[index].imageUrl,
                  ),
                );
              },
            );
          } else if (state is NewArrivalsLoading) {
            return const CustomLoadingIndicator();
          }

          return const SizedBox.shrink();
        },
        listener: (context, state) {
          if (state is NewArrivalsError) {
            showSnackBar(context, title: state.errMessage);
          }
        },
      ),
    );
  }
}
