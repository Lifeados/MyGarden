import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'lib/ui/assets/icons/yellowratingstar.svg',
        ),
        SvgPicture.asset(
          'lib/ui/assets/icons/yellowratingstar.svg',
        ),
        SvgPicture.asset(
          'lib/ui/assets/icons/yellowratingstar.svg',
        ),
        SvgPicture.asset(
          'lib/ui/assets/icons/yellowratingstar.svg',
        ),
        SvgPicture.asset(
          'lib/ui/assets/icons/greyratingstar.svg',
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            '4.0',
            style: TextStyle(color: AppColors.primaryDarkColor),
          ),
        ),
        const Text(
          '(146 Reviews)',
          style: TextStyle(color: AppColors.primaryDarkColor),
        ),
      ],
    );
  }
}
