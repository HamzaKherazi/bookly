import 'package:bookly/constants.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({Key? key}) : super(key: key);

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: kEmpty,
                  size: MediaQuery.of(context).size.width * .5,
                ),
                SizedBox(height: 20),
                Text('There is no products'),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: const CartItem(),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24),
                CustomButton(onPressed: () {}, title: 'Confirm Order'),
                SizedBox(height: 24),
              ],
            ),
          );
  }
}
