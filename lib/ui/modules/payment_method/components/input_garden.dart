import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class InputGarden extends StatelessWidget {
  final String label;
  final bool obscure;

  const InputGarden({super.key, required this.label, required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, bottom: 6, right: 20),
      height: 54,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryGreenColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.primaryGreenColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
