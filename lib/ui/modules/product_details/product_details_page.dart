import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import '../product_details/components/plant_info.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'lib/ui/assets/icons/arrowleft.svg',
            width: 20,
            height: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'lib/ui/assets/icons/favorite.svg',
              width: 20,
              height: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'lib/ui/assets/icons/share.svg',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'lib/ui/assets/images/faux-watermelon-peperomia-plant-gray-pot.png',
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Peperomia Flex',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryDarkColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9.5, bottom: 24.5),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'lib/ui/assets/icons/yellowratingstar.svg',
                        ),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/yellowratingstar.svg',
                        ),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/yellowratingstar.svg',
                        ),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/yellowratingstar.svg',
                        ),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/greyratingstar.svg',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            '4.0',
                            style: TextStyle(color: AppColors.primaryDarkColor),
                          ),
                        ),
                        const Text(
                          '(146 Reviews)',
                          style: TextStyle(color: AppColors.primaryDarkColor),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci sem feugiat ut nullam nisl orci, volutpat, felis. Nunc elit, et mattis commodo condimentum tellus et. Dolor sit amet, consectetur adipiscing elit. Orci sem feugiat ut nullam nisl orci.',
                    style: const TextStyle(color: AppColors.primaryDarkColor),
                    maxLines: isExpanded ? null : 4,
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? 'Read less' : 'Read more',
                      style: const TextStyle(
                        color: AppColors.primaryGreenColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Color(0xFFDBDAD9),
                      thickness: 0.9,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PlantInfo(label: 'Size', information: 'Medium'),
                      SizedBox(
                        height: 44,
                        child: VerticalDivider(
                          color: Color(0xFFDBDAD9),
                          thickness: 1,
                        ),
                      ),
                      PlantInfo(label: 'Plant', information: 'Orchid'),
                      SizedBox(
                        height: 44,
                        child: VerticalDivider(
                          color: Color(0xFFDBDAD9),
                          thickness: 1,
                        ),
                      ),
                      PlantInfo(label: 'Height', information: '10.5”'),
                      SizedBox(
                        height: 44,
                        child: VerticalDivider(
                          color: Color(0xFFDBDAD9),
                          thickness: 1,
                        ),
                      ),
                      PlantInfo(label: 'Humidnity', information: '80%'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\$60.00',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: const Color.fromRGBO(
                                        154, 160, 154, 0.3),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                ),
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                border: Border.symmetric(
                                  horizontal: BorderSide(
                                    color: Color.fromRGBO(154, 160, 154, 0.3),
                                  ),
                                ),
                              ),
                              child: const Center(
                                  child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              )),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: const Color.fromRGBO(
                                        154, 160, 154, 0.3),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        fixedSize: const Size(double.infinity, 56),
                        backgroundColor: const Color(0xFF4B8E4B),
                        foregroundColor: const Color(0xFFFFFFFF),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            'lib/ui/assets/icons/shoppingcart.svg',
                          ),
                          const Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            '\$60.00',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
