import 'package:flutter/material.dart';

import 'ui/modules/home/home_page.dart';

void main() {
  runApp(const MyGarden());
}

class MyGarden extends StatefulWidget {
  const MyGarden({super.key});

  @override
  State<MyGarden> createState() => _MyGardenState();
}

class _MyGardenState extends State<MyGarden> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homePage',
      routes: {
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}
