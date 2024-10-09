import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'lib/ui/assets/icons/arrow-left.svg',
            width: 24,
            height: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'lib/ui/assets/icons/favorite.svg',
              width: 24,
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('lib/ui/assets/icons/share.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'lib/ui/assets/images/faux-watermelon-peperomia-plant-gray-pot.png',
              fit: BoxFit.cover,
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Peperomia Flex'),
                  const Text('4.0 (146 Reviews)'),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci, sem feugiat ut nullam nisl orci, volutpat, felis. Nunc elit, et mattis commodo condimentum tellus et. Read More',
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9AA09A),
                            ),
                          ),
                          Text(
                            'Medium',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0E110E),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 44,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Plant',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9AA09A),
                            ),
                          ),
                          Text(
                            'Orchid',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0E110E),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 44,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Height',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9AA09A),
                            ),
                          ),
                          Text(
                            '10.5"',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0E110E),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 44,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Humidnity',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9AA09A),
                            ),
                          ),
                          Text(
                            '80%',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0E110E),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$60.00'),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                              border: Border.all(
                                color: const Color.fromRGBO(154, 160, 154, 0.3),
                              ),
                            ),
                            child: const Icon(
                              Icons.remove,
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
                            child: const Center(child: Text('1')),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                              border: Border.all(
                                color: const Color.fromRGBO(154, 160, 154, 0.3),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      fixedSize: const Size(335, 56),
                      backgroundColor: const Color(0xFF4B8E4B),
                      foregroundColor: const Color.fromRGBO(247, 247, 247, 1),
                    ),
                    child: const Text(
                      'texto',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
