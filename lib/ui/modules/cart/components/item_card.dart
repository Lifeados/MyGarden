import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class ItemCard extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String size;
  final double price;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.size,
    required this.price,
  });

  @override
  State<ItemCard> createState() => ItemCardState();
}

class ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 144,
          height: 125,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primaryWhiteColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Image.asset(
              widget.imagePath,
              width: 105,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: 125,
          width: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
                child: Text(
                  widget.productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  'Size: ${widget.size}',
                ),
              ),
              Text(
                '\$${widget.price}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
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
        ),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(255, 59, 59, 0.1),
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'lib/ui/assets/icons/trash.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
