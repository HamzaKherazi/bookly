import 'package:bookly/core/models/book_preview_model.dart';

class CartItemModel {
  final int cartItemId;
  final int cartId;
  final int bookId;
  final BookPreviewModel? book;
  final int quantity;

  CartItemModel({
    required this.cartItemId,
    required this.cartId,
    required this.bookId,
    required this.quantity,
    this.book,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    cartItemId: json['cart_item_id'],
    cartId: json['cart_id'],
    bookId: json['book_id'],
    book: BookPreviewModel.fromJson(json['book']),
    quantity: json['quantity'],
  );

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(
      cartItemId: cartItemId,
      cartId: cartId,
      bookId: bookId,
      quantity: quantity ?? this.quantity,
      book: book,
    );
  }
}
