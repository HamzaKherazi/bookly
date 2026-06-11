import 'package:bookly/constants.dart';
import 'package:bookly/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupInputSection extends StatelessWidget {
  const SignupInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          "Sign Up to continue",
          style: TextStyle(color: kTextColor1, fontSize: 15),
        ),

        const SizedBox(height: 32),

        // Name
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Name",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(height: 8),

        const CustomTextField(hintText: "example@gmail.com"),

        const SizedBox(height: 20),

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
      ],
    );
  }
}
