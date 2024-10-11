import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

import 'components/order_status.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 70,
        leading: Image.asset('lib/ui/assets/icons/arrow-left.png'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  '-------------------',
                  style: TextStyle(
                      fontSize: 20, color: AppColors.primaryGreenColor),
                ),
                Text(
                  '-------------------',
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade300),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OrderStatus(
                icon: 'lib/ui/assets/icons/location.png',
                title: 'Address',
              ),
              OrderStatus(
                icon: 'lib/ui/assets/icons/card.png',
                title: 'Payment',
              ),
              OrderStatus(
                icon: 'lib/ui/assets/icons/document.png',
                title: 'Summery',
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
