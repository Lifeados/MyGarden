import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_garden/data/usecase/local_load_camera.dart';
import 'package:my_garden/data/usecase/remote_load_authentication.dart';
import 'package:my_garden/data/usecase/remote_load_product.dart';
import 'package:my_garden/ui/modules/base/base_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:my_garden/ui/modules/home/home_page.dart';
import 'ui/modules/order_summary/order_summary_page.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/cart/cart_page.dart';
import 'package:my_garden/ui/modules/order_details/order_details.dart';
import 'package:my_garden/ui/modules/login/login_page.dart';
import 'package:my_garden/ui/modules/payment_method/payment_method_page.dart';
import 'package:my_garden/ui/modules/onboarding/onboarding_page.dart';
import 'package:my_garden/ui/modules/plant_scanner/plant_scanner_page.dart';
import 'package:my_garden/ui/modules/shipping_address/shipping_address_page.dart';
import 'ui/modules/product_details/product_details_page.dart';
import 'package:my_garden/ui/modules/signup/signup_page.dart';
import 'ui/modules/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => FirebaseFirestore.instance),
        Provider(create: (context) => RemoteLoadAuthentication()),
        Provider(
          create: (context) => RemoteLoadProduct(
            firestore: Provider.of<FirebaseFirestore>(
              context,
              listen: false,
            ),
          ),
        ),
        FutureProvider<List<CameraDescription>>(
          create: (context) async {
            final localLoadCamera = LocalLoadCamera();
            return await localLoadCamera.load();
          },
          initialData: const [],
        ),
      ],
      child: const MyGardenApp(),
    ),
  );
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
              return AppColors.primaryGreenColor;
            }
            return AppColors.backgroundColor;
          }),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/base': (context) => const BasePage(),
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/home': (context) => const HomePage(),
        '/product/details': (context) => const ProductDetailsPage(),
        '/order': (context) => const OrderSummaryPage(),
        '/payment': (context) => PaymentMethodPage(),
        '/cart': (context) => const CartPage(),
        '/order/details': (context) => const OrderDetails(),
        '/shipping/address': (context) => const ShippingAddressPage(),
        '/search/plant': (context) => const PlantScannerPage(),
      },
    );
  }
}
