import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/cart/components/item_card.dart';
import 'package:my_garden/ui/modules/cart/components/row_value.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  List<ItemCard> itemCard = [
    const ItemCard(
      imagePath:
          'lib/ui/assets/images/faux-watermelon-peperomia-plant-gray-pot.png',
      productName: 'Peperomia Flex',
      size: 'M',
      price: 40.99,
    ),
    const ItemCard(
      imagePath:
          'lib/ui/assets/images/calathea-medallion-plant-white-pot-transformed.png',
      productName: 'Calathea Medallion',
      size: 'P',
      price: 20.96,
    ),
    const ItemCard(
      imagePath:
          'lib/ui/assets/images/faux-watermelon-peperomia-plant-gray-pot.png',
      productName: 'Peperomia',
      size: 'G',
      price: 60.22,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDarkColor,
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
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: [
              SizedBox(
                height: 270,
                child: ListView.builder(
                  itemCount: itemCard.length,
                  itemBuilder: (buildContext, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ItemCard(
                        imagePath: itemCard[index].imagePath,
                        productName: itemCard[index].productName,
                        size: itemCard[index].size,
                        price: itemCard[index].price,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const RowValue(
                label: 'Item Total',
                value: 40.99,
                labelStyle: TextStyle(
                  color: AppColors.primaryDarkColor,
                  fontSize: 16,
                ),
                valueStyle: TextStyle(
                  color: AppColors.primaryDarkColor,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  height: 54,
                  padding: const EdgeInsets.only(
                    top: 6,
                    right: 6,
                    bottom: 6,
                    left: 20,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryGreenColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: TextField(
                          cursorHeight: 16,
                          decoration: InputDecoration(
                            labelText: 'Enter Coupon',
                            labelStyle: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryGreenColor,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 7,
                            ),
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
                          fixedSize: const Size(150, 44),
                          backgroundColor: AppColors.primaryGreenColor,
                          foregroundColor: AppColors.primaryGreyColor,
                        ),
                        child: const Text('Apply Coupon'),
                      ),
                    ],
                  ),
                ),
              ),
              const RowValue(
                label: 'Discount',
                value: 1.00,
                labelStyle: TextStyle(
                  color: AppColors.primaryGreenColor,
                  fontSize: 16,
                ),
                valueStyle: TextStyle(
                  color: AppColors.primaryGreenColor,
                  fontSize: 16,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 22),
                child: RowValue(
                  label: 'Shipping Charge',
                  value: 3.00,
                  labelStyle: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontSize: 16,
                  ),
                  valueStyle: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                child: RowValue(
                  label: 'Grand Total',
                  value: 42.99,
                  labelStyle: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  valueStyle: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontSize: 18,
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
                  fixedSize: const Size(335, 56),
                  backgroundColor: AppColors.primaryGreenColor,
                  foregroundColor: AppColors.primaryGreyColor,
                ),
                child: const Text(
                  'Proceed to Checkout',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
