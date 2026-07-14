import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/payment/presentation/views/helper/show_error_snackbar.dart';
import 'package:bookly/features/payment/presentation/views/helper/show_success_dialog.dart';
import 'package:bookly/features/payment/presentation/views/widgets/card_fields_widget.dart';
import 'package:bookly/features/payment/presentation/views/widgets/divider_widget.dart';
import 'package:bookly/features/payment/presentation/views/widgets/header_section.dart';
import 'package:bookly/features/payment/presentation/views/widgets/order_summary_section.dart';
import 'package:bookly/features/payment/presentation/views/widgets/shipping_fields_widget.dart';
import 'package:flutter/material.dart';
import 'package:bookly/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentViewBody extends StatefulWidget {
  final double totalAmount;
  final String orderId;

  const PaymentViewBody({
    super.key,
    this.totalAmount = 1000,
    this.orderId = 'P87Yh',
  });

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _zipController.dispose();
    _cardController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            OrderSummarySection(orderId: widget.orderId),
            const SizedBox(height: 24),

            // Divider
            const DividerWidget(),
            const SizedBox(height: 24),

            // Shipping Section
            const HeaderSection('📍 Shipping Address'),
            const SizedBox(height: 16),
            ShippingFieldsWidget(
              nameController: _nameController,
              streetController: _streetController,
              cityController: _cityController,
              zipController: _zipController,
            ),
            const SizedBox(height: 24),

            // Divider
            const DividerWidget(),
            const SizedBox(height: 24),

            // Payment Section
            const HeaderSection('💳 Payment Method'),
            const SizedBox(height: 24),

            PaymentOptionsWidget(),
            const SizedBox(height: 24),
            CardFieldsWidget(
              cardController: _cardController,
              expiryController: _expiryController,
              cvvController: _cvvController,
            ),
            const SizedBox(height: 30),

            // Pay Button
            CustomButton(
              onPressed: _processPayment,
              title: 'Pay \$${_calculateTotal().toStringAsFixed(2)}',
            ),
            const SizedBox(height: 12),

            // Cancel Button
            CustomButton(
              onPressed: () => Navigator.pop(context),
              title: 'Cancel',
              backgroundColor: kWhite,
              foregroundColor: kTextColor1,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  double _calculateTotal() {
    const delivery = 0.1;
    return widget.totalAmount + delivery;
  }

  void _processPayment() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        showSuccessDialog(context);
      }
    } catch (e) {
      if (mounted) {
        showErrorSnackbar(context, e.toString());
      }
    }
  }
}

class PaymentOptionsWidget extends StatelessWidget {
  const PaymentOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: PaymentButton(
                icon: FontAwesomeIcons.paypal,
                iconColor: const Color(0xFF00457C),
                label: 'PayPal',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: PaymentButton(
                icon: FontAwesomeIcons.google,
                iconColor: const Color(0xFF4285F4),
                label: 'G Pay',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: PaymentButton(
                icon: FontAwesomeIcons.apple,
                iconColor: Colors.black,
                label: 'Apple Pay',
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const OrDivider(),
      ],
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE0E0E0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: 18, color: iconColor),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Or', style: TextStyle(color: Colors.grey, fontSize: 14)),
        ),
        Expanded(child: Divider(thickness: 1, color: Color(0xFFE0E0E0))),
      ],
    );
  }
}
