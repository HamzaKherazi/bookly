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
        emit(CartFailure(error.errMessage));
      },
      (cart) {
        emit(CartSuccess(cart));
      },
    );
  }

  //For UI
  Future<void> updateQuantity(int cartItemId, int quantity) async {
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

  //For UI
  Future<void> removeItem(int cartItemId) async {
    final cartState = state as CartSuccess;

    var result = await cartRepo.removeItem(cartItemId);
    result.fold((failure) => emit(CartFailure(failure.errMessage)), (r) {
      final updatedItems = cartState.cart!.items
          .where((item) => item.cartItemId != cartItemId)
          .toList();

      final updatedCart = cartState.cart!.copyWith(items: updatedItems);

      emit(CartSuccess(updatedCart));
    });

    final updatedItems = cartState.cart!.items
        .where((item) => item.cartItemId != cartItemId)
        .toList();

    final updatedCart = cartState.cart!.copyWith(items: updatedItems);

    emit(CartSuccess(updatedCart));
  }

  Future<void> removeAllItems() async {
    final cartState = state as CartSuccess;

    var result = await cartRepo.removeAllItems(cartState.cart!.cartId);
    result.fold((failure) => emit(CartFailure(failure.errMessage)), (r) {
      final emptyCart = cartState.cart!.copyWith(items: []);

      emit(CartSuccess(emptyCart));
    });
  }

  //Save cart to DB
  Future<void> saveCart() async {
    final cartState = state as CartSuccess;

    final result = await cartRepo.saveCart(cartState.cart!);
    result.fold((error) {
      emit(CartFailure(error.errMessage));
    }, (value) {});
  }
}
