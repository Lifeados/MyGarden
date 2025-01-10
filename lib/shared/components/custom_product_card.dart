import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class CustomProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String category;
  final double price;
  final VoidCallback onTap;
  const CustomProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 300,
        width: 230,
        decoration: BoxDecoration(
          color: AppColors.primaryWhiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  right: 16,
                  left: 16,
                ),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDarkColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.secondaryGreyColor,
                      ),
                    ),
                    Text(
                      'R\$$price',
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryDarkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
