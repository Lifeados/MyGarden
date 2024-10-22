import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/ui/modules/order_summary/components/delivery_address.dart';
import 'package:my_garden/ui/modules/order_summary/components/item_details.dart';
import 'package:my_garden/ui/modules/order_summary/components/payment_details.dart';

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
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 300,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                'Item Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: -10,
                      blurRadius: 25,
                      offset: Offset(0, 10),
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
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  fixedSize: const Size(300, 56),
                  backgroundColor: const Color(0xFF4B8E4B),
                  foregroundColor: const Color(0xFFFFFFFF),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
