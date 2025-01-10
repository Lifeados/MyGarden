import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class CustomSeedCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final double price;
  final VoidCallback onTap;
  const CustomSeedCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 232,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  right: 8,
                  left: 8,
                ),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDarkColor,
                        ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
