class ProductModel {
  final String name;
  final String weight;
  final String category;
  final String reference;
  final double price;
  final String imageUrl;
  final String cicle;
  final String plantingTime;
  final bool isAvailable;

  ProductModel({
    required this.name,
    required this.weight,
    required this.category,
    required this.reference,
    required this.price,
    required this.imageUrl,
    required this.cicle,
    required this.plantingTime,
    required this.isAvailable,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: _capitalizeWords(word: json['name']),
      weight: json['weight'],
      category: _capitalizeWords(word: json['category']),
      reference: json['reference'],
      price: json['price'] * 1.0,
      imageUrl: json['imageUrl'],
      cicle: json['cicle'],
      plantingTime: json['plantingTime'],
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'weight': weight,
      'category': category,
      'reference': reference,
      'price': price,
      'imageUrl': imageUrl,
      'cicle': cicle,
      'plantingTime': plantingTime,
      'isAvailable': isAvailable,
    };
  }

  static String _capitalizeWords({required String word}) {
    if (word.isEmpty) {
      return word;
    }
    return word.split(' ').map((e) {
      if (e.isNotEmpty) {
        return e[0].toUpperCase() + e.substring(1).toLowerCase();
      }
      return e;
    }).join(' ');
  }
}
