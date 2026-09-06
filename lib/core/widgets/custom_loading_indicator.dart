import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(color: kPrimaryColor);
  }
}
