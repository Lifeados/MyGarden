import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/utils/app_colors.dart';
import 'components/order_status.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: OrderStatus(
          title1: 'Adress',
          icon1: 'lib/ui/assets/icons/location.svg',
          iconColor1: AppColors.primaryGreenColor,
          title2: 'Payment',
          icon2: 'lib/ui/assets/icons/card.svg',
          iconColor2: AppColors.primaryGreenColor,
          title3: 'Summery',
          icon3: 'lib/ui/assets/icons/document.svg',
          progressLine1: AppColors.primaryGreenColor,
          progressLine2: AppColors.secondaryTextColor,
        ),
      ),
    );
  }
}
