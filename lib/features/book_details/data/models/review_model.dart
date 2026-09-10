class ReviewModel {
  final int reviewId;
  final String userName;
  final int rating;
  final String? comment;
  const ReviewModel({
    required this.reviewId,
    required this.userName,
    required this.rating,
    this.comment,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewId: (json['review_id'] as num).toInt(),
      userName: json['user_name'] as String,
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String?,
    );
  }
}
