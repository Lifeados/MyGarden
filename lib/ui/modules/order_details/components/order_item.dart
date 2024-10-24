import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/order_details/components/button_garden.dart';
import 'package:my_garden/ui/modules/order_details/components/order_status.dart';

class OrderItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  const OrderItem(
      {super.key, required this.imagePath, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName),
                    const Padding(
                      padding: EdgeInsets.only(top: 2, bottom: 6),
                      child: Text(
                        '\$ 60.00',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.backgroundColor,
                      ),
                      child: const Text(
                        'Delivered',
                        style: TextStyle(
                          color: AppColors.primaryGreenColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Text('Qty: 1'),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: OrderStatus(
            title1: 'Placed',
            icon1: 'lib/ui/assets/icons/placed.svg',
            iconColor1: AppColors.primaryGreenColor,
            title2: 'Shipped',
            icon2: 'lib/ui/assets/icons/shipped.svg',
            iconColor2: AppColors.primaryGreenColor,
            title3: 'Delivered',
            icon3: 'lib/ui/assets/icons/delivered.svg',
            iconColor3: AppColors.primaryGreenColor,
          ),
        ),
        const Row(
          children: [
            Expanded(
              child: ButtonGarden(
                buttonText: 'Return',
                buttonColor: AppColors.backgroundColor,
                textColor: AppColors.primaryDarkColor,
                heightButton: 40,
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ButtonGarden(
                buttonText: 'Write a Review',
                buttonColor: AppColors.backgroundColor,
                textColor: AppColors.primaryDarkColor,
                heightButton: 40,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const ButtonGarden(
          buttonText: 'Reorder',
          buttonColor: AppColors.primaryGreenColor,
          textColor: AppColors.primaryWhiteColor,
          heightButton: 40,
          fontSize: 14,
        ),
      ],
    );
  }
}

class OrderItemTwo extends StatelessWidget {
  final String imagePath;
  final String productName;
  const OrderItemTwo(
      {super.key, required this.imagePath, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName),
                    const Padding(
                      padding: EdgeInsets.only(top: 2, bottom: 6),
                      child: Text(
                        '\$ 60.00',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.backgroundColor,
                      ),
                      child: const Text(
                        'Placed',
                        style: TextStyle(
                          color: AppColors.primaryGreenColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Text('Qty: 1'),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: OrderStatus(
            title1: 'Placed',
            icon1: 'lib/ui/assets/icons/placed.svg',
            iconColor1: AppColors.primaryGreenColor,
            title2: 'Shipped',
            icon2: 'lib/ui/assets/icons/shipped.svg',
            title3: 'Delivered',
            icon3: 'lib/ui/assets/icons/delivered.svg',
          ),
        ),
        const ButtonGarden(
          buttonText: 'Cancel Order',
          buttonColor: AppColors.backgroundColor,
          textColor: AppColors.primaryDarkColor,
          heightButton: 40,
          fontSize: 14,
        ),
      ],
    );
  }
}

class OrderItemThree extends StatelessWidget {
  final String imagePath;
  final String productName;
  const OrderItemThree(
      {super.key, required this.imagePath, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    imagePath,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName),
                    const Padding(
                      padding: EdgeInsets.only(top: 2, bottom: 6),
                      child: Text(
                        '\$ 60.00',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.backgroundColor,
                      ),
                      child: const Text(
                        'Delivered',
                        style: TextStyle(
                          color: AppColors.primaryGreenColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Text('Qty: 1'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: List.generate(
              5,
              (index) {
                return SvgPicture.asset('lib/ui/assets/icons/star.svg');
              },
            ),
          ),
        ),
        const Row(
          children: [
            Expanded(
              child: ButtonGarden(
                buttonText: 'Reorder',
                buttonColor: AppColors.primaryGreenColor,
                textColor: AppColors.primaryWhiteColor,
                heightButton: 40,
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ButtonGarden(
                buttonText: 'View Details',
                buttonColor: AppColors.primaryGreyColor,
                textColor: AppColors.primaryDarkColor,
                heightButton: 40,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
