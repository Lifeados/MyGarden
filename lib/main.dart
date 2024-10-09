import 'package:flutter/material.dart';
import 'package:my_garden/ui/modules/product_details/product_details_page.dart';

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
      initialRoute: '/product-details',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/product-details': (context) => const ProductDetailsPage(),
      },
    );
  }
}
