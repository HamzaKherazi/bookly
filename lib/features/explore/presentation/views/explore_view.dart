import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/explore/data/repos/explore_repo.dart';
import 'package:bookly/features/explore/presentation/view_models/books_cubit/books_cubit.dart';
import 'package:bookly/features/explore/presentation/views/widgets/explore_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(getIt.get<ExploreRepo>())..getAllBooks(),
      child: const ExploreViewBody(),
    );
  }
}
