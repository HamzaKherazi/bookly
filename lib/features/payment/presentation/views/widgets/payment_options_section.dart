import 'package:bookly/constants.dart';
import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:bookly/features/payment/presentation/views/widgets/payment_option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentOptionsSection extends StatelessWidget {
  const PaymentOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: PaymentOptionButton(
                icon: FontAwesomeIcons.paypal,
                iconColor: kPrimaryColor,
                label: 'PayPal',
                onTap: () {
                  showSnackBar(
                    context,
                    title: 'PayPal is not implemented yet.',
                    
                    backgroundColor: const Color.fromARGB(255, 9, 145, 208),
                    icon: Icons.info,
                  );
                },
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: PaymentOptionButton(
                icon: FontAwesomeIcons.google,
                iconColor: kPrimaryColor,
                label: 'Google Pay',
                onTap: () {
                  showSnackBar(
                    context,
                    title: 'Google Pay is not implemented yet.',
                    backgroundColor: const Color.fromARGB(255, 9, 145, 208),
                    icon: Icons.info,
                  );
                },
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: PaymentOptionButton(
                icon: FontAwesomeIcons.apple,
                iconColor: kPrimaryColor,
                label: 'Apple Pay',
                onTap: () {
                  showSnackBar(
                    context,
                    title: 'Apple Pay is not implemented yet.',
                    backgroundColor: const Color.fromARGB(255, 9, 145, 208),
                    icon: Icons.info,
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        const OrDivider(),
      ],
    );
  }
}
