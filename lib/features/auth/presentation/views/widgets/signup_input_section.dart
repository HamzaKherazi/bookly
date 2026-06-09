import 'package:bookly/constants.dart';
import 'package:bookly/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupInputSection extends StatelessWidget {
  const SignupInputSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: kPrimaryColor,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "Create an account to continue",
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

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
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
        ),
      ],
    );
  }
}
