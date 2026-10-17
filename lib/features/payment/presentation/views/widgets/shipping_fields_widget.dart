import 'package:bookly/constants.dart';
import 'package:bookly/features/payment/data/models/city_model.dart';
import 'package:bookly/features/payment/presentation/views/widgets/cities_combobox.dart';
import 'package:bookly/features/payment/presentation/views/widgets/shipping_input_field.dart';
import 'package:flutter/material.dart';

class ShippingFieldsWidget extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController streetController;
  final TextEditingController zipController;
  final CityModel? selectedCity;
  final ValueChanged<CityModel?> onCityChanged;

  const ShippingFieldsWidget({
    super.key,
    required this.nameController,
    required this.streetController,
    required this.zipController,
    required this.selectedCity,
    required this.onCityChanged,
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

          Row(
            children: [
              Expanded(
                child: CitiesCombobox(
                  selectedCity: widget.selectedCity,
                  onChanged: widget.onCityChanged,
                  hint: 'Select',
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
          const SizedBox(height: 14),
          ShippingInputField(
            controller: widget.streetController,
            label: 'Street Address',
            hint: '123 Main St',
            icon: Icons.home_outlined,
          ),
        ],
      ),
    );
  }
}
