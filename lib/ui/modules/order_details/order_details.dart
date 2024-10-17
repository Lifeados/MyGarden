import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/utils/app_colors.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackgroundColor,
      appBar: AppBar(
        leadingWidth: 70,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'lib/ui/assets/icons/arrowleft.svg',
            width: 20,
            height: 20,
          ),
        ),
        backgroundColor: AppColors.cardBackgroundColor,
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
