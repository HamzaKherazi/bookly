class BookCoverModel {
  final int bookId;
  final String? imageUrl;

  BookCoverModel({required this.bookId, required this.imageUrl});
  factory BookCoverModel.fromJson(Map<String, dynamic> json) {
    return BookCoverModel(bookId: json['book_id'], imageUrl: json['image_url']);
  }
}
