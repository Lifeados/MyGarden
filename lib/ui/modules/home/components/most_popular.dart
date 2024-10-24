import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Plant> plants = [
      Plant(
        image:
            'lib/ui/assets/images/faux-watermelon-peperomia-plant-gray-pot.png',
        title: 'Peperomia Flex',
        description: 'Indoor Plant',
        price: 60.00,
      ),
    ];
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Most Popular',
              style: TextStyle(
                color: AppColors.primaryTextColor,
              ),
            ),
            TextButton(
              onPressed: null,
              child: Text(
                'View All',
                style: TextStyle(color: AppColors.primaryGreenColor),
              ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: plants.length,
          itemBuilder: (context, index) {
            final plant = plants[index];
            return ListTile(
              leading: Image.network(plant.image),
              title: Text(plant.title),
              subtitle: Text(plant.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('\$${plant.price}'),
                  const Icon(Icons.energy_savings_leaf_outlined),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class Plant {
  final String image;
  final String title;
  final String description;
  final double price;

  Plant({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });
}
