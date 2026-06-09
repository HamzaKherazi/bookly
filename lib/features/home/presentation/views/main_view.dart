import 'package:bookly/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: MainViewBody()));
  }
}
