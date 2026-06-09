import 'package:bookly/constants.dart';
import 'package:bookly/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginInputSection extends StatelessWidget {
  const LoginInputSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Log in",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "Login in to continue",
          style: TextStyle(color: kTextColor1, fontSize: 15),
        ),

        const SizedBox(height: 32),

        // Email
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Email",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(height: 8),

        const CustomTextField(hintText: "example@gmail.com"),

        const SizedBox(height: 20),

        // Password
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Password",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(height: 8),

        const CustomTextField(hintText: "Enter your password"),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: true,
                  checkColor: kWhite,
                  activeColor: kPrimaryColor,
                  side: const BorderSide(color: kPrimaryColor, width: 1.5),
                  onChanged: (value) {},
                ),
                const Text("Remember Me", style: TextStyle(color: kTextColor1)),
              ],
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(overlayColor: Colors.transparent),
              child: const Text(
                "Forgot Password?",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
