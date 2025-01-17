import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class CustomBottomNavigationIcon extends StatelessWidget {
  final String assetPath;
  final bool isSelected;

  const CustomBottomNavigationIcon({
    required this.assetPath,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color =
        isSelected ? AppColors.primaryGreenColor : AppColors.secondaryDarkColor;

    return SvgPicture.asset(
      assetPath,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
      height: 23,
    );
  }
}
