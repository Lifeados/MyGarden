import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final TextStyle? textStyle;
  final bool isOutlined;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isOutlined = false,
    this.icon,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return isOutlined
        ? SizedBox(
            height: 48,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(
                  color: AppColors.secondaryGreyColor,
                ),
              ),
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null ? icon! : const SizedBox.shrink(),
                  Text(
                    label,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                backgroundColor: AppColors.primaryGreenColor,
                foregroundColor: AppColors.primaryWhiteColor,
              ),
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null ? icon! : const SizedBox.shrink(),
                  Text(
                    label,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          );
  }
}
