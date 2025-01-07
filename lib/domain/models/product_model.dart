class ProductModel {
  final String name;
  final String reference;
  final String imageUrl;
  final double weight;
  final double price;
  final bool isAvailable;
  final int quantity;
  final List<String> varieties;

  ProductModel({
    required this.name,
    required this.reference,
    required this.imageUrl,
    required this.weight,
    required this.price,
    required this.isAvailable,
    this.quantity = 0,
    this.varieties = const [],
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      reference: json['reference'],
      imageUrl: json['imageUrl'],
      weight: json['weight'],
      price: json['price'],
      isAvailable: json['isAvailable'],
      quantity: json['quantity'] ?? 0,
      varieties:
          (json['varieties'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }
}
