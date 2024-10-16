import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class ButtonGarden extends StatelessWidget {
  final String buttonText;

  const ButtonGarden({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryGreenColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          buttonText,
          style:
              const TextStyle(color: AppColors.tertiaryTextColor, fontSize: 16),
        ),
      ),
    );
  }
}
