class CategoryModel {
  final String categoryId;
  final String name;
  final String imageUrl;
  final int productCount;
  final bool isActive;
  final String? description;
  final String? parentCategoryId;
  final bool isFeatured;
  final int displayOrder;
  final List<String> seoKeywords;

  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.imageUrl,
    required this.productCount,
    required this.isActive,
    this.description,
    this.parentCategoryId,
    this.isFeatured = false,
    this.displayOrder = 0,
    this.seoKeywords = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'name': name,
      'imageUrl': imageUrl,
      'productCount': productCount,
      'isActive': isActive,
      'description': description,
      'parentCategoryId': parentCategoryId,
      'isFeatured': isFeatured,
      'displayOrder': displayOrder,
      'seoKeywords': seoKeywords,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      productCount: map['productCount'],
      isActive: map['isActive'],
      description: map['description'],
      parentCategoryId: map['parentCategoryId'],
      isFeatured: map['isFeatured'] ?? false,
      displayOrder: map['displayOrder'] ?? 0,
      seoKeywords: List<String>.from(map['seoKeywords'] ?? []),
    );
  }
}