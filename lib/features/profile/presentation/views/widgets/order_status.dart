// ============================================================
// ORDER STATUS HELPERS
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderStatus {
  static const String pending = 'pending';
  static const String processing = 'processing';
  static const String shipped = 'shipped';
  static const String delivered = 'delivered';
  static const String cancelled = 'cancelled';

  static String getDisplayName(String status) {
    switch (status) {
      case pending:
        return 'Pending';
      case processing:
        return 'Processing';
      case shipped:
        return 'Shipped';
      case delivered:
        return 'Delivered';
      case cancelled:
        return 'Cancelled';
      default:
        return status;
    }
  }

  static Color getColor(String status) {
    switch (status) {
      case pending:
        return const Color(0xffF59E0B);
      case processing:
        return const Color(0xff3B82F6);
      case shipped:
        return const Color(0xff8B5CF6);
      case delivered:
        return const Color(0xff2E7D32);
      case cancelled:
        return const Color(0xffDC2626);
      default:
        return Colors.grey;
    }
  }

  static IconData getIcon(String status) {
    switch (status) {
      case pending:
        return Icons.pending_outlined;
      case processing:
        return Icons.hourglass_top_outlined;
      case shipped:
        return Icons.local_shipping_outlined;
      case delivered:
        return Icons.check_circle_outlined;
      case cancelled:
        return Icons.cancel_outlined;
      default:
        return Icons.help_outline;
    }
  }
}
