class PromoModel {
  final int promoId;
  final String title;
  final String? description;
  final String imageUrl;
  final String buttonText;
  final String startDate;
  final String endDate;
  final String createdAt;
  final bool isActive;

  PromoModel({
    required this.promoId,
    required this.title,
    this.description,
    required this.imageUrl,
    required this.buttonText,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.isActive,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return PromoModel(
      promoId: json['promo_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      buttonText: json['button_text'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      createdAt: json['created_at'] as String,
      isActive: json['is_active'] as bool,
    );
  }
}
