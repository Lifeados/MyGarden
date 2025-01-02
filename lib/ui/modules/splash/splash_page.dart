import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreenColor,
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: 'feltrin\n',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryWhiteColor,
              height: 1,
            ),
            children: [
              TextSpan(
                text: '           SEMENTES',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryWhiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
