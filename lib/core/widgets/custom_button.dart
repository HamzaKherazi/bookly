import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, required this.title}) : super(key: key);

 final void Function()? onPressed;
 final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            elevation: 5,
                            shadowColor: kPrimaryColor.withOpacity(.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child:  Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
  }
}