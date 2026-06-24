import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(kPrimaryColor),

          elevation: WidgetStateProperty.all(5),

          shadowColor: WidgetStateProperty.all(kPrimaryColor.withOpacity(.4)),

          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Styles.textStyle18.copyWith(
                color: kWhite,
                letterSpacing: .5,
              ),
            ),
            SizedBox(width: 30),
            Icon(Icons.shopping_cart, size: 24, color: kWhite),
          ],
        ),
      ),
    );
  }
}
