class BookPreviewModel {
  final int bookId;
  final String title;
  final String? imageUrl;
  final String author;
  final String category;
  final double price;
  final double averageRating;
  final int ratingCount;

  BookPreviewModel({
    required this.bookId,
    required this.title,
    this.imageUrl,
    required this.author,
    required this.category,
    required this.price,
    required this.averageRating,
    required this.ratingCount,
  });

  factory BookPreviewModel.fromJson(Map<String, dynamic> json) {
    final author = json['authors'];
    final category = json['categories'];

    return BookPreviewModel(
      bookId: json['book_id'],
      title: json['title'],
      author: '${author['first_name']} ${author['last_name']}',
      category: category['name'],
      price: (json['price'] as num).toDouble(),
      averageRating: (json['average_rating'] as num).toDouble(),
      ratingCount: json['rating_count'],
      imageUrl: json['image_url'],
    );
  }
}
