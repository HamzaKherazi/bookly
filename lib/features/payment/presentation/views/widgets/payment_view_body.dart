import 'package:bookly/core/helpers/show_snack_bar.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/cart/data/repos/cart_repo.dart';
import 'package:bookly/features/cart/presentation/view_models/cart_cubit/cart_cubit.dart';
import 'package:bookly/features/cart/presentation/views/helper/get_total_amount.dart';
import 'package:bookly/features/order/data/models/create_order_model.dart';
import 'package:bookly/features/order/presentation/view_models/order_cubit/order_cubit.dart';
import 'package:bookly/features/payment/data/models/city_model.dart';
import 'package:bookly/features/payment/presentation/views/helper/show_success_dialog.dart';
import 'package:bookly/features/payment/presentation/views/widgets/card_fields_widget.dart';
import 'package:bookly/features/payment/presentation/views/widgets/divider_widget.dart';
import 'package:bookly/features/payment/presentation/views/widgets/header_section.dart';
import 'package:bookly/features/payment/presentation/views/widgets/order_summary_section.dart';
import 'package:bookly/features/payment/presentation/views/widgets/payment_options_section.dart';
import 'package:bookly/features/payment/presentation/views/widgets/shipping_fields_widget.dart';
import 'package:flutter/material.dart';
import 'package:bookly/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  CityModel? _selectedCity;

  @override
  void dispose() {
    _nameController.dispose();
    _streetController.dispose();
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
            OrderSummarySection(
              deliveryPrice: _selectedCity == null
                  ? 0
                  : _selectedCity!.shippingCost,
            ),
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
              zipController: _zipController,
              selectedCity: _selectedCity,
              onCityChanged: (city) => setState(() => _selectedCity = city),
            ),
            const SizedBox(height: 24),

            // Divider
            const DividerWidget(),
            const SizedBox(height: 24),

            // Payment Section
            const HeaderSection('💳 Payment Method'),
            const SizedBox(height: 24),

            PaymentOptionsSection(),
            const SizedBox(height: 24),
            CardFieldsWidget(
              cardController: _cardController,
              expiryController: _expiryController,
              cvvController: _cvvController,
            ),
            const SizedBox(height: 30),

            // Pay Button
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return BlocListener<OrderCubit, OrderState>(
                  listener: (context, state) {
                    if (state is OrderCreated) {
                      showSuccessDialog(context, orderId: state.orderId);
                    } else if (state is OrderFailure) {
                      showSnackBar(context, title: state.errMessage);
                    }
                  },
                  child: CustomButton(
                    onPressed: () async {
                      await processPayment(
                        context,
                        formKey: _formKey,
                        order: CreateOrderModel(
                          cityId: _selectedCity!.cityId,
                          deliveryFees: _selectedCity!.shippingCost,
                          shippingAddress: _streetController.text,
                          paymentMethodId: 1,
                          items: state is CartSuccess ? state.cart!.items : [],
                        ),
                      );
                    },
                    title:
                        'Pay \$${_calculateTotal(deliveryPrice: _selectedCity == null ? 0 : _selectedCity!.shippingCost, totalAmount: state is CartSuccess ? getTotalAmount(state.cart!.items) : 0).toStringAsFixed(2)}',
                  ),
                );
              },
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

  double _calculateTotal({
    required double deliveryPrice,
    required double totalAmount,
  }) {
    return totalAmount + deliveryPrice;
  }

  Future<void> processPayment(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required CreateOrderModel order,
  }) async {
    if (!formKey.currentState!.validate()) return;

    try {
      await BlocProvider.of<OrderCubit>(context).createOrder(order);

      CartRepo cartRepo = getIt.get<CartRepo>();
      await cartRepo.deleteCart();
      if (mounted) {}
    } catch (e) {
      if (mounted) {
        showSnackBar(context, title: e.toString());
      }
    }
  }
}
