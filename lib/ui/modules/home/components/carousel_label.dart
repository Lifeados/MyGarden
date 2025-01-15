import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class CarouselLabel extends StatelessWidget {
  final String title;
  final String textButton;
  final VoidCallback onPressed;

  const CarouselLabel({
    super.key,
    required this.title,
    required this.textButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        right: 6,
        left: 16,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              textButton,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryGreenColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
