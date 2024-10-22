import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final int quantity;

  const ItemDetails({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            height: 71,
            width: 71,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text('\$${price.toStringAsFixed(2)}'),
              ),
              Text('Qty: $quantity'),
            ],
          ),
        ),
      ],
    );
  }
}
