import 'package:my_garden/domain/models/product_category_model.dart';

class ProductModel {
  final String product;
  final List<ProductCategoryModel> categories;

  ProductModel({
    required this.product,
    required this.categories,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
      product: json['product'],
      categories: (json['categories'] as List)
          .map((e) => ProductCategoryModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'categories': categories.map((e) => e.toJson()).toList(),
    };
  }
}
