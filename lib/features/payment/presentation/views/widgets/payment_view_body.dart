import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bookly/constants.dart';

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
            const SectionHeader('📍 Shipping Address'),
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
            const SectionHeader('💳 Payment Method'),
            const SizedBox(height: 16),
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
        _showSuccessDialog();
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackbar(e.toString());
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const SuccessDialog(
        orderId: 'P87Yh', // In production, use widget.orderId
      ),
    );
  }

  void _showErrorSnackbar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment failed: $error'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}

// ============================================
// DIVIDER WIDGET
// ============================================

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: kTextColor1.withOpacity(0.08));
  }
}

// ============================================
// SECTION HEADER WIDGET
// ============================================

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyle16.copyWith(
            color: kTextColor1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ============================================
// ORDER SUMMARY SECTION WIDGET
// ============================================

class OrderSummarySection extends StatelessWidget {
  final String orderId;
  final double deliveryPrice;

  const OrderSummarySection({
    super.key,
    required this.orderId,
    this.deliveryPrice = 0,
  });

  @override
  Widget build(BuildContext context) {
    final subTotal = 1000.0; // Example subtotal, replace with actual value
    final grandTotal = subTotal + deliveryPrice;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Summary',
                style: Styles.textStyle16.copyWith(
                  color: kTextColor1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '#$orderId',
                  style: Styles.textStyle14.copyWith(
                    color: kPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Subtotal Row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: Styles.textStyle14.copyWith(
                    color: kTextColor1.withOpacity(0.6),
                  ),
                ),
                Text(
                  '${subTotal.toStringAsFixed(2)}',
                  style: Styles.textStyle14.copyWith(
                    color: kTextColor1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Tax Row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Fee',
                  style: Styles.textStyle14.copyWith(
                    color: kTextColor1.withOpacity(0.6),
                  ),
                ),
                Text(
                  '${deliveryPrice.toStringAsFixed(2)}',
                  style: Styles.textStyle14.copyWith(
                    color: kTextColor1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 24),

          // Total Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: Styles.textStyle18.copyWith(
                  color: kTextColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${grandTotal.toStringAsFixed(2)}',
                style: Styles.textStyle20.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================
// SHIPPING INPUT FIELD WIDGET
// ============================================

class ShippingInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? errorText;

  const ShippingInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ' *',
              style: TextStyle(
                color: Colors.red.shade700,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: kPrimaryColor.withOpacity(0.6),
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kPrimaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red.shade700, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red.shade700, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            errorText: errorText,
            errorStyle: TextStyle(color: Colors.red.shade700, fontSize: 12),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          validator: (value) {
            if ((value == null || value.isEmpty)) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
      ],
    );
  }
}

// ============================================
// SHIPPING FIELDS WIDGET
// ============================================

class ShippingFieldsWidget extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController streetController;
  final TextEditingController cityController;
  final TextEditingController zipController;

  const ShippingFieldsWidget({
    super.key,
    required this.nameController,
    required this.streetController,
    required this.cityController,
    required this.zipController,
  });

  @override
  State<ShippingFieldsWidget> createState() => _ShippingFieldsWidgetState();
}

class _ShippingFieldsWidgetState extends State<ShippingFieldsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ShippingInputField(
            controller: widget.nameController,
            label: 'Full Name',
            hint: 'John Doe',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 14),
          ShippingInputField(
            controller: widget.streetController,
            label: 'Street Address',
            hint: '123 Main St',
            icon: Icons.home_outlined,
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: ShippingInputField(
                  controller: widget.cityController,
                  label: 'City',
                  hint: 'New York',
                  icon: Icons.location_city_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ShippingInputField(
                  controller: widget.zipController,
                  label: 'ZIP Code',
                  hint: '10001',
                  icon: Icons.pin_drop_outlined,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================
// CARD INPUT FIELD WIDGET
// ============================================

class CardInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;

  const CardInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: const TextStyle(color: kTextColor1),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: Styles.textStyle14.copyWith(
          color: kTextColor1.withOpacity(0.3),
        ),
        labelStyle: Styles.textStyle14.copyWith(
          color: kTextColor1.withOpacity(0.6),
          fontSize: 13,
        ),
        prefixIcon: Icon(icon, color: kPrimaryColor.withOpacity(0.5), size: 20),
        filled: true,
        fillColor: kBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}

// ============================================
// CARD FIELDS WIDGET
// ============================================

class CardFieldsWidget extends StatefulWidget {
  final TextEditingController cardController;
  final TextEditingController expiryController;
  final TextEditingController cvvController;

  const CardFieldsWidget({
    super.key,
    required this.cardController,
    required this.expiryController,
    required this.cvvController,
  });

  @override
  State<CardFieldsWidget> createState() => _CardFieldsWidgetState();
}

class _CardFieldsWidgetState extends State<CardFieldsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CardInputField(
            controller: widget.cardController,
            label: 'Card Number',
            hint: '1234 5678 9012 3456',
            icon: Icons.credit_card_outlined,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: CardInputField(
                  controller: widget.expiryController,
                  label: 'Expiry Date',
                  hint: 'MM/YY',
                  icon: Icons.calendar_today_outlined,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CardInputField(
                  controller: widget.cvvController,
                  label: 'CVV',
                  hint: '123',
                  icon: Icons.security_outlined,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// ============================================
// SUCCESS DIALOG WIDGET
// ============================================

class SuccessDialog extends StatelessWidget {
  final String orderId;

  const SuccessDialog({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Successful!',
              style: TextStyle(
                color: kTextColor1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Order #$orderId confirmed',
              style: TextStyle(
                color: kTextColor1.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kWhite,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
