import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
  });

  final void Function()? onPressed;
  final String title;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? kPrimaryColor,
          ),
          elevation: WidgetStateProperty.all(5),
          shadowColor: WidgetStateProperty.all(kPrimaryColor.withOpacity(.4)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: Text(
          title,
          style: Styles.textStyle18.copyWith(
            color: Colors.white,
            letterSpacing: .5,
          ),
        ),
      ),
    );
  }
}
