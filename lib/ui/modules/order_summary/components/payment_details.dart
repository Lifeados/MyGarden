import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentDetails extends StatelessWidget {
  final String brandImage;
  final String name;
  final String cardNumber;
  final VoidCallback? onPressed;

  const PaymentDetails({
    super.key,
    required this.brandImage,
    required this.name,
    required this.cardNumber,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: -10,
            blurRadius: 25,
            offset: Offset(0, 10),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(brandImage),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  cardNumber,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 34,
            width: 34,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                elevation: 0,
                backgroundColor: Colors.green[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: SvgPicture.asset(
                'lib/ui/assets/icons/edit.svg',
              ),
            ),
          )
        ],
      ),
    );
  }
}
