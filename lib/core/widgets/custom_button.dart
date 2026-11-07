import 'package:bookly/constants.dart';
import 'package:bookly/core/app_responsive/app_responsive.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
  });

  final void Function()? onPressed;
  final String title;
  final Color? foregroundColor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppResponsive.height(context) * 0.07,
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
          style: Styles.textStyle16.copyWith(
            color: foregroundColor ?? Colors.white,
            letterSpacing: .5,
            
          ),
        ),
      ),
    );
  }
}
