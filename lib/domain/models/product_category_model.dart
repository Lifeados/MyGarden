import 'package:my_garden/domain/models/product_variety_model.dart';

class ProductCategoryModel {
  final String category;
  final List<ProductVarietyModel> varieties;

  ProductCategoryModel({
    required this.category,
    required this.varieties,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      category: json['category'],
      varieties: (json['varieties'] as List)
          .map((e) => ProductVarietyModel.fromJson(e))
          .toList(),
    );
  }
}
