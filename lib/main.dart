import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/cart/cart_page.dart';
import 'package:my_garden/ui/modules/payment_method/payment_method_page.dart';
import 'package:my_garden/ui/modules/onboarding/onboarding_page.dart';
import 'package:my_garden/ui/modules/shipping_address/shipping_address_page.dart';
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
      theme: ThemeData(
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryGreenColor; // Cor quando marcado
            }
            return AppColors.backgroundColor; // Cor quando desmarcado
          }),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/signup': (context) => const SignUpPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/product/details': (context) => const ProductDetailsPage(),
        '/payment': (context) => PaymentMethodPage(),
        '/cart': (context) => const CartPage(),
        '/shipping/address': (context) => const ShippingAddressPage(),
      },
    );
  }
}
