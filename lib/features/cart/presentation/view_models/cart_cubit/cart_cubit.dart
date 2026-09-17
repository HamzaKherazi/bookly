import 'package:bloc/bloc.dart';
import 'package:bookly/features/cart/data/models/cart_model.dart';
import 'package:bookly/features/cart/data/repos/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  final CartRepo cartRepo;

  Future<void> getCart() async {
    emit(CartLoading());

    final result = await cartRepo.getCart();
    result.fold(
      (error) {
        emit(CartError(error.errMessage));
      },
      (cart) {
        emit(CartSuccess(cart));
      },
    );
  }

  Future<void> changeQuantity(int cartItemId, int quantity) async {
    final cartState = state as CartSuccess;
    final updatedItems = cartState.cart!.items.map((item) {
      if (item.cartItemId == cartItemId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();

    final updatedCart = cartState.cart!.copyWith(items: updatedItems);
    emit(CartSuccess(updatedCart));
  }
}
