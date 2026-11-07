// profile_view_body.dart
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/profile/data/repos/stats_repo.dart';
import 'package:bookly/features/profile/presentation/view_models/stats_cubit/stats_cubit.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_avatar.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_menu_section.dart';
import 'package:bookly/features/profile/presentation/views/widgets/profile_stats.dart';
import 'package:bookly/features/profile/presentation/views/widgets/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileHeader(),
        SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 12),

                ProfileAvatar(
                  name: 'Hamza Kherazi',
                  email: 'hamza.kherazi@email.com',
                ),
                SizedBox(height: 28),
                BlocProvider(
                  create: (context) => StatsCubit(getIt.get<StatsRepo>())..getStats(),
                  child: ProfileStats(),
                ),
                SizedBox(height: 32),
                ProfileMenuSection(),
                SizedBox(height: 32),
                SignOutButton(),
                SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
