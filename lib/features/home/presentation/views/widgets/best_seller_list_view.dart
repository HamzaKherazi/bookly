import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BestSellerCubit(getIt.get<HomeRepo>())..getBestSeller(),
      child: BlocConsumer<BestSellerCubit, BestSellerState>(
        builder: (context, state) {
          if (state is BestSellerSuccess) {
            return ListView.builder(
              itemCount: state.bestSellerBooks.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 16),
                  child: BookListViewItem(book: state.bestSellerBooks[index]),
                );
              },
            );
          }
          if (state is BestSellerLoading) {
            return CustomLoadingIndicator();
          }
          return SizedBox.shrink();
        },
        listener: (context, state) {
          if (state is BestSellerFailure) {
            showSnackBar(context, title: state.errMessage);
          }
        },
      ),
    );
  }
}
