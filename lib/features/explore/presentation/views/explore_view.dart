import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/explore/data/repos/explore_repo.dart';
import 'package:bookly/features/explore/presentation/view_models/books_cubit/books_cubit.dart';
import 'package:bookly/features/explore/presentation/view_models/categories_cubit/categories_cubit.dart';
import 'package:bookly/features/explore/presentation/views/widgets/explore_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BooksCubit(getIt.get<ExploreRepo>())..getAllBooks()),
        BlocProvider(
          create: (context) => CategoriesCubit(getIt.get<ExploreRepo>())..getAllCategories(),
        ),
      ],
      child: const ExploreViewBody(),
    );
  }
}
