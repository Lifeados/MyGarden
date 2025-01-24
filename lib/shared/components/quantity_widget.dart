import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final Function(int quantity) handleQuantity;

  const QuantityWidget({
    super.key,
    required this.value,
    required this.handleQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
        border: Border.all(
          color: AppColors.tertiaryGreyColor,
        ),
      ),
      child: Row(
        spacing: 8,
        children: [
          _QuantityButton(
            icon: Icons.remove_rounded,
            onTap: () {
              int result = value - 1;
              handleQuantity(result);
            },
            isDisabled: value <= 1,
          ),
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          _QuantityButton(
            icon: Icons.add_rounded,
            onTap: () {
              int result = value + 1;
              handleQuantity(result);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isDisabled;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: isDisabled ? null : onTap,
      child: Icon(
        icon,
        size: 30,
        color: isDisabled
            ? AppColors.tertiaryGreyColor
            : AppColors.primaryDarkColor,
      ),
    );
  }
}
