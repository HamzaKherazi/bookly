import 'package:bookly/core/models/book_preview_model.dart';

class OrderItemModel {
  final int orderItemId;
  final int bookId;
  final BookPreviewModel book;
  final int quantity;
  final double unitPrice;

  OrderItemModel({
    required this.orderItemId,
    required this.bookId,
    required this.book,
    required this.quantity,
    required this.unitPrice,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
    orderItemId: json['order_item_id'] as int,
    bookId: json['book_id'] as int,
    book: BookPreviewModel.fromJson(json['books']),
    quantity: json['quantity'] as int,
    unitPrice: json['unit_price'] as double,
  );
}
