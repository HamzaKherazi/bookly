import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/payment/presentation/views/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        title: Text('Payment', style: Styles.textStyle22),
        centerTitle: true,
      ),
      body: PaymentViewBody(),
    );
  }
}
