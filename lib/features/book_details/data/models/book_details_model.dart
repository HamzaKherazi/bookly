class BookDetailsModel {
  final int bookId;
  final String title;
  final String author;
  final String category;
  final double averageRating;
  final int ratingCount;
  final String? description;
  final String? imgUrl;
  final double price;
  const BookDetailsModel({
    required this.bookId,
    required this.title,
    required this.author,
    required this.category,
    required this.averageRating,
    required this.ratingCount,
    this.description,
    this.imgUrl,
    required this.price,
  });
  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      bookId: (json['book_id'] as num).toInt(),
      title: json['title'] as String,
      author:
          '${json['authors']['first_name']} '
          '${json['authors']['last_name']}',
      category: json['categories']['name'] as String,
      averageRating: (json['average_rating'] as num).toDouble(),
      ratingCount: (json['rating_count'] as num).toInt(),
      description: json['description'] as String?,
      imgUrl: json['image_url'] as String?,
      price: (json['price'] as num).toDouble(),
    );
  }
}
