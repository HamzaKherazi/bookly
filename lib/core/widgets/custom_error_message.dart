import 'package:flutter/widgets.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({Key? key, required this.errMessage}) : super(key: key);
final String errMessage;
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Error occurred"));
  }
}
