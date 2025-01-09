import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class CustomSeedCard extends StatelessWidget {
  const CustomSeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: AppColors.backgroundColor,
              ),
              child: Image.asset(
                fit: BoxFit.contain,
                'lib/ui/assets/images/peperomia_plant.png',
                height: 164,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Peperomia Flex',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDarkColor,
                    ),
                  ),
                  Text(
                    'Qualquer',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.secondaryGreyColor,
                    ),
                  ),
                  Text(
                    '45.00',
                    style: TextStyle(
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
    );
  }
}
