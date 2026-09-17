import 'package:bookly/features/cart/data/models/cart_item_model.dart';

class CartModel {
  final int cartId;
  final String userId;
  final List<CartItemModel> items;
  final DateTime createdAt;

  CartModel({
    required this.cartId,
    required this.userId,
    required this.items,
    required this.createdAt,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    cartId: json['cart_id'],
    userId: json['user_id'],
    items: List<CartItemModel>.from(
      json['items'].map((x) => CartItemModel.fromJson(x)),
    ),
    createdAt: DateTime.parse(json['created_at']),
  );

  CartModel copyWith({
    int? cartId,
    String? userId,
    List<CartItemModel>? items,
    DateTime? createdAt,
  }) {
    return CartModel(
      cartId: cartId ?? this.cartId,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
