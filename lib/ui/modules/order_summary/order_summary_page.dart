import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/cart/components/row_value.dart';
import 'package:my_garden/ui/modules/order_summary/components/delivery_address.dart';
import 'package:my_garden/ui/modules/order_summary/components/item_details.dart';
import 'package:my_garden/ui/modules/order_summary/components/payment_details.dart';
import 'package:my_garden/ui/modules/payment_method/components/order_status.dart';

class OrderSummaryPage extends StatefulWidget {
  const OrderSummaryPage({super.key});

  @override
  State<OrderSummaryPage> createState() => OrderSummaryPageState();
}

class OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'lib/ui/assets/icons/arrowleft.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrderStatus(
                title1: 'Address',
                icon1: 'lib/ui/assets/icons/location.svg',
                title2: 'Payment',
                icon2: 'lib/ui/assets/icons/card.svg',
                title3: 'Summery',
                icon3: 'lib/ui/assets/icons/document.svg',
                progressLine1: AppColors.primaryGreenColor,
                progressLine2: AppColors.primaryGreenColor,
                iconColor1: AppColors.primaryGreenColor,
                iconColor2: AppColors.primaryGreenColor,
                iconColor3: AppColors.primaryGreenColor,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 12),
                child: Text(
                  'Item Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primaryWhiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.primaryGreyColor,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 12),
                    )
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                width: double.infinity,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ItemDetails(
                      image: 'lib/ui/assets/images/faux-watermelon.png',
                      name: 'Peperomia Flex',
                      price: 60.00,
                      quantity: 1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ItemDetails(
                      image: 'lib/ui/assets/images/faux-watermelon.png',
                      name: 'Medallion Calathea',
                      price: 75.00,
                      quantity: 1,
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
                    color: AppColors.primaryDarkColor,
                  ),
                ),
              ),
              DeliveryAddress(
                name: 'Smith Watson',
                address: '4517 Washington Ave. Manchester, Kentucky 39495',
                onPressed: () {},
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 12),
                child: Text(
                  'Payment Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
              ),
              PaymentDetails(
                brandImage: 'lib/ui/assets/icons/mastercard.svg',
                name: 'Smith Watson',
                cardNumber: '6895 7852 5898 4200',
                onPressed: () {},
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 12),
                child: Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDarkColor,
                  ),
                ),
              ),
              const RowValue(
                label: 'Item Total',
                value: 135.00,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: RowValue(
                  label: 'Discount',
                  value: 1.00,
                  labelStyle: TextStyle(
                    color: AppColors.primaryGreenColor,
                  ),
                  valueStyle: TextStyle(
                    color: AppColors.primaryGreenColor,
                  ),
                ),
              ),
              const RowValue(
                label: 'Shipping Charge',
                value: 3.00,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: AppColors.primaryGreyColor,
                ),
              ),
              const RowValue(
                label: 'Grand Total',
                value: 137.00,
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkColor,
                ),
                valueStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDarkColor,
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      fixedSize: const Size.fromHeight(56),
                      backgroundColor: AppColors.primaryGreenColor,
                      foregroundColor: AppColors.primaryWhiteColor,
                    ),
                    child: const Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
