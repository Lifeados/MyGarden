import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/payment_method/components/order_status.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => ShippingAddressPageState();
}

class ShippingAddressPageState extends State<ShippingAddressPage> {
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderStatus(
                title1: 'Adress',
                icon1: 'lib/ui/assets/icons/location.svg',
                iconColor1: AppColors.primaryGreenColor,
                title2: 'Payment',
                icon2: 'lib/ui/assets/icons/card.svg',
                iconColor2: AppColors.secondaryTextColor,
                title3: 'Summery',
                icon3: 'lib/ui/assets/icons/document.svg',
                progressLine1: AppColors.secondaryTextColor,
                progressLine2: AppColors.secondaryTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
