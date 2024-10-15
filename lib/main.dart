import 'package:flutter/material.dart';
import 'package:my_garden/ui/modules/cart/cart_page.dart';
import 'package:my_garden/ui/modules/payment_method/payment_method_page.dart';
import 'package:my_garden/ui/modules/onboarding/onboarding_page.dart';
import 'ui/modules/product_details/product_details_page.dart';
import 'package:my_garden/ui/modules/signup/signup_page.dart';

import 'ui/modules/splash/splash_page.dart';

void main() {
  runApp(const MyGardenApp());
}

class MyGardenApp extends StatelessWidget {
  const MyGardenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/signup': (context) => const SignUpPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/product/details': (context) => const ProductDetailsPage(),
        '/cart': (context) => const CartPage(),
        '/payment': (context) => const PaymentMethodPage(),
      },
    );
  }
}
