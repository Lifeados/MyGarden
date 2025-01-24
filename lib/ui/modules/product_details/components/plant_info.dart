import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class PlantInfo extends StatelessWidget {
  final String label;
  final String information;
  const PlantInfo({
    super.key,
    required this.label,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$label: ',
        style: const TextStyle(
          fontSize: 15,
          color: AppColors.primaryDarkColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: information,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.secondaryGreyColor,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
