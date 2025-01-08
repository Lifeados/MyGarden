import 'package:my_garden/domain/models/product_category_model.dart';

class ProductModel {
  final String name;
  final List<ProductCategoryModel> categories;

  ProductModel({
    required this.name,
    required this.categories,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      categories: (json['categories'] as List)
          .map((e) => ProductCategoryModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'categories': categories.map((e) => e.toJson()).toList(),
    };
  }
}
