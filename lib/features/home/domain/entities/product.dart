class Review {
  final String username;
  final String comment;
  final double rating;
  final DateTime createdAt;

  Review({
    required this.username,
    required this.comment,
    required this.rating,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}

class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String imageUrl;
  final List<String> images;
  bool isFavorite;
  final List<String> specialOfferIds;
  final List<Review> reviews;
  final List<String> colors;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.images,
    this.specialOfferIds = const [],
    this.reviews = const [],
    this.isFavorite = false,
    required this.colors,
  });
  double getDiscountedPrice(double discount) =>
      price * (price * discount / 100);

  bool get hasSpecialOffer => specialOfferIds.isNotEmpty;

  double get averageRating {
    if (reviews.isEmpty) {
      return 0.0;
    }
    final double sumRateing = reviews.fold(
      0,
      (double sum, Review r) => sum + r.rating,
    );
    final double avg = sumRateing / reviews.length;
    return double.parse(avg.toStringAsFixed(1));
  }

  int get totalReview => reviews.length;
}
