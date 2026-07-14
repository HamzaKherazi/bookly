import 'package:bookly/constants.dart';
import 'package:bookly/features/payment/presentation/views/widgets/shipping_input_field.dart';
import 'package:flutter/material.dart';

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
