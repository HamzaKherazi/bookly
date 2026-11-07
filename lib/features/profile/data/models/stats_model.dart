class StatsModel {
  final int bookOrdered;
  final double totalSpent;
  final DateTime memberSince;

  StatsModel({
    required this.bookOrdered,
    required this.totalSpent,
    required this.memberSince,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      bookOrdered: (json['book_ordered'] as num?)?.toInt() ?? 0,
      totalSpent: (json['total_spent'] as num?)?.toDouble() ?? 0.0,
      memberSince: DateTime.parse(
        json['memberSince'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }
}
