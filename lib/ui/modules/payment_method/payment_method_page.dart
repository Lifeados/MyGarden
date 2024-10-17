import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/utils/app_colors.dart';

import 'components/button_garden.dart';
import 'components/input_garden.dart';
import 'components/order_status.dart';
import 'components/saved_cards.dart';

class PaymentMethodPage extends StatelessWidget {
  final List<String> cardBrands = [
    'lib/ui/assets/icons/mastercard.svg',
    'lib/ui/assets/icons/visa.svg',
  ];

  final List<String> cardNumbers = [
    '6895 7852 5898 4200',
    '7892 5487 8600 3525',
  ];

  PaymentMethodPage({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OrderStatus(
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
              const Padding(
                padding: EdgeInsets.only(top: 22, bottom: 12),
                child: Text(
                  'Saved Cards',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                physics:
                    const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                shrinkWrap: true,
                itemBuilder: (BuildContext, int index) {
                  return SavedCards(
                    cardBrand: cardBrands[index],
                    cardNumber: cardNumbers[index],
                  );
                },
                itemCount: cardBrands.length,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.cardBackgroundColor,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      offset: Offset(0, 10),
                      blurRadius: 50,
                    ),
                  ],
                ),
                child: ExpansionTile(
                  tilePadding: const EdgeInsets.only(right: 16, left: 16),
                  title: const Text('Credit/Debit Card'),
                  leading: SvgPicture.asset(
                    'lib/ui/assets/icons/mastercard.svg',
                    height: 40,
                    width: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  childrenPadding: const EdgeInsets.all(16),
                  children: const [
                    InputGarden(label: 'Card Number', obscure: false),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: InputGarden(
                          label: 'Card Holder Name', obscure: false),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child:
                              InputGarden(label: 'Expire Date', obscure: false),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InputGarden(label: 'CVV', obscure: false),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SavedCards(
                cardBrand: 'lib/ui/assets/icons/paypal.svg',
                cardNumber: 'Paypal',
              ),
              const SizedBox(
                height: 30,
              ),
              const ButtonGarden(buttonText: 'Next'),
            ],
          ),
        ),
      ),
    );
  }
}
