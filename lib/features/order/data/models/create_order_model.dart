import 'package:bookly/features/cart/data/models/cart_item_model.dart';

class CreateOrderModel {
  final String shippingAddress;
  final int cityId;
  final int paymentMethodId;
  final double deliveryFees;
  final List<CartItemModel> items;

  const CreateOrderModel({
    required this.shippingAddress,
    required this.cityId,
    required this.paymentMethodId,
    required this.deliveryFees,
    required this.items,
  });
}
