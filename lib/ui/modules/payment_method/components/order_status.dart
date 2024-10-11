import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  final String title;
  final String icon;
  const OrderStatus({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
          ),
          child: Image.asset(icon),
        ),
        Text(title),
      ],
    );
  }
}
