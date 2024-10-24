import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/utils/app_colors.dart';

class DeliveryAddress extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback? onPressed;

  const DeliveryAddress({
    super.key,
    required this.name,
    required this.address,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryWhiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.primaryGreyColor,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 12),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDarkColor,
                    ),
                  ),
                ),
                Text(
                  address,
                  style: const TextStyle(
                    color: AppColors.primaryDarkColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 34,
            width: 34,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                elevation: 0,
                backgroundColor: AppColors.secondaryGreenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: SvgPicture.asset(
                'lib/ui/assets/icons/edit.svg',
              ),
            ),
          )
        ],
      ),
    );
  }
}
