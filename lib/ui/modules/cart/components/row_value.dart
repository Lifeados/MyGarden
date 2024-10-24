import 'package:flutter/material.dart';

class RowValue extends StatelessWidget {
  final String label;
  final double value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  const RowValue({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: labelStyle ??
              const TextStyle(
                fontSize: 16,
              ),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: valueStyle ??
              const TextStyle(
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
