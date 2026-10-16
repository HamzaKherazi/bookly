import 'package:bookly/features/order/data/models/order_item_model.dart';

class OrderModel {
  final int orderId;
  final double totalAmount;
  List<OrderItemModel> items;
  final DateTime createdAt;

  OrderModel({
    required this.orderId,
    required this.totalAmount,
    required this.items,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['order_id'] as int,
      totalAmount: double.parse(json['total_amount'].toString()),
      items: List<OrderItemModel>.from(
        json['order_items'].map((x) => OrderItemModel.fromJson(x)),
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
