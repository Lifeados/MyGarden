import 'package:my_garden/domain/models/product_variety_model.dart';

class ProductModel {
  final String product;
  final List<ProductVarietyModel> varieties;

  ProductModel({
    required this.product,
    required this.varieties,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      product: json['product'],
      varieties: (json['varieties'] as List)
          .map((e) => ProductVarietyModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'varieties': varieties.map((e) => e.toJson()).toList(),
    };
  }
}
