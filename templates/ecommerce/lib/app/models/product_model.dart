/// Product model. Replace with your Firebase/API shape.
class ProductModel {
  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageUrl,
  });

  final String id;
  final String name;
  final double price;
  final String? description;
  final String? imageUrl;

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0,
      description: map['description'] as String?,
      imageUrl: map['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'imageUrl': imageUrl,
      };
}
