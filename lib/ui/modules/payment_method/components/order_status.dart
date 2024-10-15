import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/utils/app_colors.dart';

class OrderStatus extends StatelessWidget {
  final String title1;
  final String icon1;
  final Color? iconColor1;
  final Color progressLine1;
  final String title2;
  final String icon2;
  final Color? iconColor2;
  final Color progressLine2;
  final String title3;
  final String icon3;
  final Color? iconColor3;
  const OrderStatus({
    super.key,
    required this.title1,
    required this.icon1,
    this.iconColor1,
    required this.title2,
    required this.icon2,
    this.iconColor2,
    required this.title3,
    required this.icon3,
    this.iconColor3,
    required this.progressLine1,
    required this.progressLine2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                '-------------------',
                style: TextStyle(fontSize: 20, color: progressLine1),
              ),
              Text(
                '-------------------',
                style: TextStyle(fontSize: 20, color: progressLine2),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryGreyColor,
                  ),
                  child: Container(
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      icon1,
                      colorFilter: iconColor1 != null
                          ? ColorFilter.mode(iconColor1!, BlendMode.srcIn)
                          : null,
                    ),
                  ),
                ),
                Text(title1),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryGreyColor,
                  ),
                  child: Container(
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      icon2,
                      colorFilter: iconColor2 != null
                          ? ColorFilter.mode(iconColor2!, BlendMode.srcIn)
                          : null,
                    ),
                  ),
                ),
                Text(title2),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryGreyColor,
                  ),
                  child: Container(
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      icon3,
                      colorFilter: iconColor3 != null
                          ? ColorFilter.mode(iconColor3!, BlendMode.srcIn)
                          : null,
                    ),
                  ),
                ),
                Text(title3),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
