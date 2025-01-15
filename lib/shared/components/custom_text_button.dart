import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String? icon;
  final String label;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        spacing: 12,
        children: [
          icon != null && icon!.isNotEmpty
              ? SvgPicture.asset(icon!)
              : const SizedBox.shrink(),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryDarkColor,
            ),
          ),
        ],
      ),
    );
  }
}
