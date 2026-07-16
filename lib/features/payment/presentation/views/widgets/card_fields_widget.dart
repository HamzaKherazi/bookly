import 'package:bookly/constants.dart';
import 'package:bookly/features/payment/presentation/views/widgets/card_input_field.dart';
import 'package:flutter/material.dart';

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
