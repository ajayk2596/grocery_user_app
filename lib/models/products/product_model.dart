class ProductItemModel {
  final String productid;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final bool isAvailable;
  final bool isFeatured;
  final String categoryId;

  ProductItemModel({
    required this.productid,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.isAvailable,
    required this.isFeatured,
    required this.categoryId,
  });

  factory ProductItemModel.fromMap(Map<String, dynamic> data) {
    return ProductItemModel(
      productid: data['id'] ?? '',
      name: data['name'] ?? 'Unnamed',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      isAvailable: data['isAvailable'] ?? false,
      isFeatured: data['isFeatured'] ?? false,
      categoryId: data['categoryId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': productid,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'isAvailable': isAvailable,
      'isFeatured': isFeatured,
      'categoryId': categoryId,
    };
  }
}
