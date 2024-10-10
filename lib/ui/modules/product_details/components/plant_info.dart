import 'package:flutter/material.dart';

class PlantInfo extends StatelessWidget {
  final String label;
  final String information;
  const PlantInfo({
    super.key,
    required this.label,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF9AA09A),
          ),
        ),
        Text(
          information,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF0E110E),
          ),
        ),
      ],
    );
  }
}
