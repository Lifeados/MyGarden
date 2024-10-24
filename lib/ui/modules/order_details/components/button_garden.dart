import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonGarden extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double heightButton;
  final double fontSize;
  final String? iconButton;

  const ButtonGarden(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.heightButton,
      required this.fontSize,
      this.iconButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightButton,
      child: iconButton != null
          ? TextButton.icon(
              label: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: fontSize),
              ),
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onPressed: () {},
              icon: SvgPicture.asset(
                iconButton!,
                colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
              ),
            )
          : TextButton(
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: fontSize),
              ),
            ),
    );
  }
}
