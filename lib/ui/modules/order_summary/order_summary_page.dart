import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

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
        title: const Text('Checkout'),
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
              const Text('Item Details'),
              const SizedBox(
                height: 12,
              ),
              Container(
                color: Colors.green[300],
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 300,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: 300,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Delivery Address'),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey,
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Smith Watson'),
                          Text('4517 Washington Ave. Manchester, Kentucky'),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Delivery Address'),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 100,
                width: 300,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.black,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Smith Watson'),
                        Text('6895 7852 5898 4200'),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Order Summary'),
              const SizedBox(
                height: 12,
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
