class ProductModel {
  String? id; // Product ID
  String name; // Product Name
  String description; // Product Description
  int stock; // Available Stock
  double price; // Price of Product
  String brand; // Brand Name
  String images; // List of Image URLs
  double discount; // Discount in percentage
  DateTime createdDate; // Product Created Date
  DateTime updatedDate; // Product Updated Date

  ProductModel({
    this.id,
    required this.name,
    required this.description,
    required this.stock,
    required this.price,
    required this.brand,
    required this.images,
    required this.discount,
    required this.createdDate,
    required this.updatedDate,
  });

  // Convert ProductModel to Map (for Firestore or JSON)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'stock': stock,
      'price': price,
      'brand': brand,
      'images': images,
      'discount': discount,
      'createdDate': createdDate.toIso8601String(),
      'updatedDate': updatedDate.toIso8601String(),
    };
  }

  // Convert Map to ProductModel (for Firestore or JSON)
  // factory ProductModel.fromMap(Map<String, dynamic> map) {
  //   return ProductModel(
  //     id: map['id'],
  //     name: map['name'],
  //     description: map['description'],
  //     stock: map['stock'],
  //     price: map['price'],
  //     brand: map['brand'],
  //     images: List<String>.from(map['images']),
  //     discount: map['discount'],
  //     createdDate: DateTime.parse(map['createdDate']),
  //     updatedDate: DateTime.parse(map['updatedDate']),
  //   );
  // }
}
