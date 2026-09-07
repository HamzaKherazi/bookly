import 'package:flutter/widgets.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.errMessage});
final String errMessage;
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Error occurred"));
  }
}
