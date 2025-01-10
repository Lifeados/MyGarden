import 'package:flutter/material.dart';
import 'package:my_garden/domain/models/product_model.dart';
import 'package:my_garden/shared/components/custom_seed_card.dart';

class CustomCarousel extends StatelessWidget {
  final List<ProductModel> items;
  const CustomCarousel({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CustomSeedCard(
            imageUrl: item.imageUrl,
            title: item.name,
            category: item.category,
            price: item.price,
            onTap: () {},
          );
        },
      ),
    );
  }
}
