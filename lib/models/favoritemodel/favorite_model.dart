class FavoriteModel {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final DateTime addedAt;

  FavoriteModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.addedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  static FavoriteModel fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      addedAt: DateTime.parse(map['addedAt']),
    );
  }
}
