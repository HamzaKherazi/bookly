import 'package:bookly/constants.dart';
import 'package:bookly/core/widgets/status_bar_wrapper.dart';
import 'package:bookly/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, this.pageIndex});
  final int? pageIndex;

  @override
  Widget build(BuildContext context) {
    return StatusBarWrapper(
      color: kBackgroundColor,
      iconBrightness: Brightness.dark,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: MainViewBody(initialIndex: pageIndex ?? 0)),
      ),
    );
  }
}
