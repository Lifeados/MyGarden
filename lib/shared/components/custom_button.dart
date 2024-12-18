import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final TextStyle style;
  final bool isOutlined;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    this.isOutlined = false,
    required this.onPressed,
    required this.icon,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return isOutlined
        ? SizedBox(
            height: 48,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(
                  width: 1,
                  color: AppColors.secondaryGreyColor,
                ),
              ),
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(
                      width: 8,
                    )
                  ],
                  Text(
                    label,
                    style: style,
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                fixedSize: const Size(double.infinity, 56),
                backgroundColor: const Color(0xFF4B8E4B),
                foregroundColor: const Color(0xFFFFFFFF),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SvgPicture.asset(
                  //   'lib/ui/assets/icons/shoppingcart.svg',
                  // ),
                  Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    child: VerticalDivider(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '\$60.00',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
