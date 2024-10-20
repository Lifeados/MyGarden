import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/payment_method/components/button_garden.dart';
import 'package:my_garden/ui/modules/payment_method/components/order_status.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => ShippingAddressPageState();
}

final List<Map<String, String>> addresses = [
  {
    'title': 'Home',
    'address': '4517 Washington Ave.\nManchester, Kentucky 39495',
  },
  {
    'title': 'Work',
    'address': '2118 Thornridge Cir.\nSyracuse, Connecticut 35624',
  },
  {
    'title': 'Other',
    'address': '2972 Westheimer Rd.\nSanta Ana, Illinois 85486',
  },
];

class ShippingAddressPageState extends State<ShippingAddressPage> {
  final int _selectedAddressIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryDarkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const OrderStatus(
              title1: 'Address',
              icon1: 'lib/ui/assets/icons/location.svg',
              iconColor1: AppColors.primaryGreenColor,
              title2: 'Payment',
              icon2: 'lib/ui/assets/icons/card.svg',
              iconColor2: AppColors.primaryGreenColor,
              title3: 'Summary',
              icon3: 'lib/ui/assets/icons/document.svg',
              progressLine1: AppColors.primaryGreyColor,
              progressLine2: AppColors.primaryGreyColor,
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 335,
                  height: 109,
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.backgroundColor,
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        offset: Offset(0, 10),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Radio(
                      value: index,
                      groupValue: _selectedAddressIndex,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    title: Text(
                      addresses[index]['title']!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text(addresses[index]['address']!),
                    trailing: const Icon(Icons.more_vert),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 15),
              child: ButtonGarden(buttonText: '+ Add New Address'),
            ),
            const ButtonGarden(buttonText: 'Next'),
          ]),
        ),
      ),
    );
  }
}
