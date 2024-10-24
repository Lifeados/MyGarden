import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/ui/modules/order_details/components/button_garden.dart';

import '../../../shared/utils/app_colors.dart';
import 'components/order_item.dart';

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
          'Order Details',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.cardBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    offset: Offset(0, 15),
                    blurRadius: 15,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order ID: 58967895",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 7, bottom: 22),
                    child: Text(
                      "Order Date: June 25, 2022",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    separatorBuilder: (context, index) => const Divider(
                      color: AppColors.shadowColor,
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      return const Column(
                        children: [
                          OrderItem(
                            imagePath:
                                'lib/ui/assets/images/peperomia_plant.png',
                            productName: 'Peperomia Flex',
                          ),
                          Divider(
                            color: AppColors.shadowColor,
                            height: 40,
                            thickness: 1,
                          ),
                          OrderItemTwo(
                            imagePath:
                                'lib/ui/assets/images/peperomia_plant.png',
                            productName: 'Peperomia Flex',
                          ),
                          Divider(
                            color: AppColors.shadowColor,
                            height: 40,
                            thickness: 1,
                          ),
                          OrderItemThree(
                            imagePath:
                                'lib/ui/assets/images/peperomia_plant.png',
                            productName: 'Peperomia Flex',
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 12),
              child: Text(
                'Delivery Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              '4517 Washington Ave. Manchester, Kentucky 39495',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const Divider(
              height: 24,
              color: AppColors.shadowColor,
              thickness: 1,
            ),
            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Item Total',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '\$135.00',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: TextStyle(
                    color: AppColors.primaryGreenColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$1.00',
                  style: TextStyle(
                    color: AppColors.primaryGreenColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping Charge',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$3.00',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 40,
              color: AppColors.shadowColor,
              thickness: 1,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$137.00',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: const ButtonGarden(
          buttonText: 'View Invocation',
          buttonColor: AppColors.primaryGreenColor,
          textColor: AppColors.cardBackgroundColor,
          heightButton: 56,
          fontSize: 16,
          iconButton: 'lib/ui/assets/icons/eye.svg',
        ),
      ),
    );
  }
}
