class ProductVarietyModel {
  final String name;
  final String weight;
  final double price;
  final bool isAvailable;
  final String imageUrl;

  ProductVarietyModel({
    required this.name,
    required this.weight,
    required this.price,
    required this.isAvailable,
    required this.imageUrl,
  });

  factory ProductVarietyModel.fromJson(Map<String, dynamic> json) {
    return ProductVarietyModel(
      name: json['name'],
      weight: json['weight'] * 1.0,
      price: json['price'] * 1.0,
      isAvailable: json['isAvailable'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'weight': weight,
      'price': price,
      'isAvailable': isAvailable,
      'imageUrl': imageUrl,
    };
  }
}
