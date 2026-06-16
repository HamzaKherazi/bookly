import 'package:bookly/constants.dart';
import 'package:bookly/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
        title: Text('My Cart', style: TextStyle(fontWeight: FontWeight.w800)),
        centerTitle: true,
      ),
      body: CartViewBody(),
    );
  }
}
