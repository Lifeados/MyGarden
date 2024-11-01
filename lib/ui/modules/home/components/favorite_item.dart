import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/utils/app_colors.dart';

class FavoriteItem extends StatelessWidget {
  final String pathImage;
  final String title;
  final String description;
  final double price;
  final VoidCallback onPressed;

  const FavoriteItem(
      {super.key,
      required this.pathImage,
      required this.title,
      required this.description,
      required this.price,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 335,
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 105,
            height: 90,
            decoration: BoxDecoration(
                color: AppColors.primaryGreyColor,
                borderRadius: BorderRadius.circular(8)),
            child: Image.asset(pathImage),
          ),
          Expanded(
            child: SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDarkColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 12),
                    child: Text(
                      description,
                      style: const TextStyle(
                          fontSize: 14, color: AppColors.secondaryGreyColor),
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDarkColor),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      backgroundColor: AppColors.primaryGreenColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: SvgPicture.asset('lib/ui/assets/icons/leaf.svg')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
