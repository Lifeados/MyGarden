import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class SavedCards extends StatefulWidget {
  final String cardBrand;
  final String cardNumber;

  const SavedCards({
    super.key,
    required this.cardBrand,
    required this.cardNumber,
  });

  @override
  State<SavedCards> createState() => SavedCardsState();
}

class SavedCardsState extends State<SavedCards> {
  String? selectedCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10),
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cardBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            offset: Offset(0, 8),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  widget.cardBrand,
                  height: 24,
                  width: 24,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                widget.cardNumber,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: Transform.scale(
              scale: 1.4,
              child: Radio(
                toggleable: true,
                value: widget.cardNumber,
                groupValue: selectedCard,
                onChanged: (newValue) {
                  setState(
                    () {
                      selectedCard = newValue;
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
