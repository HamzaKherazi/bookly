import 'package:bookly/features/book_details/data/models/review_model.dart';

class BookDetailsModel {
  final int bookId;
  final String title;
  final String author;
  final String category;
  final double avgRating;
  final int ratingCount;
  final String? description;
  final String? imgUrl;
  final double price;
  final List<ReviewModel> reviews;
  const BookDetailsModel({
    required this.bookId,
    required this.title,
    required this.author,
    required this.category,
    required this.avgRating,
    required this.ratingCount,
    this.description,
    this.imgUrl,
    required this.price,
    required this.reviews,
  });
  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      bookId: (json['book_id'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
      avgRating: (json['avg_rating'] as num).toDouble(),
      ratingCount: (json['rating_count'] as num).toInt(),
      description: json['description'] as String?,
      imgUrl: json['image_url'] as String?,
      price: (json['price'] as num).toDouble(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
    );
  }
}
