import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/core/widgets/status_bar_wrapper.dart';
import 'package:bookly/features/auth/presentation/views/widgets/auth_redirect_section.dart';
import 'package:bookly/features/auth/presentation/views/widgets/login_input_section.dart';
import 'package:bookly/features/auth/presentation/views/widgets/logo_section.dart';
import 'package:bookly/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:bookly/features/auth/presentation/views/widgets/social_media_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusBarWrapper(
      color: kPrimaryColor,
      
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Header
                LogoSection(),
      
                // Card
                Padding(
                  padding: const EdgeInsets.only(
                    top: 140,
                    left: 24,
                    right: 24,
                    bottom: 24,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.08),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
      
                        LoginInputSection(),
      
                        const SizedBox(height: 12),
      
                        //Login Button
                        CustomButton(
                          title: 'Log in',
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.mainView);
                          },
                        ),
      
                        const SizedBox(height: 24),
      
                        OrDivider(),
      
                        const SizedBox(height: 24),
      
                        // Social Buttons
                        SocialMediaSection(),
      
                        const SizedBox(height: 24),
                        AuthRedirectSection(
                          questionText: "Don't have an account?",
                          actionText: 'Sign Up',
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.signupView);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
