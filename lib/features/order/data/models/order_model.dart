
import 'package:bookly/features/order/data/models/order_item_model.dart';

class OrderModel {
  final int? orderId;
  final double totalAmount;
  final List<OrderItemModel> items;
  final String status;
  final String shippingAddress;
  final int cityId;
  final int paymentMethodId;
  final double deliveryFees;
  final DateTime createdAt;

  OrderModel({
    required this.orderId,
    required this.totalAmount,
    required this.items,
    required this.status,
    required this.shippingAddress,
    required this.cityId,
    required this.paymentMethodId,
    required this.deliveryFees,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['order_id'] as int,
      totalAmount: json['total_amount'] as double,
      items: List<OrderItemModel>.from(
        json['order_items'].map((x) => OrderItemModel.fromJson(x)),
      ),
      status: json['status'] as String,
      shippingAddress: json['shipping_address'] as String,
      cityId: json['city_id'] as int,
      paymentMethodId: json['payment_method_id'] as int,
      deliveryFees: json['delivery_fees'] as double,

      createdAt: json['created_at'] as DateTime,
    );
  }
}
