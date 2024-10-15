import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.alphaBlend(
          const Color.fromRGBO(154, 160, 154, 0.1), Colors.white),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: null,
              icon: Image.asset(
                'lib/ui/assets/images/category.png',
                height: 20,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: null,
                  icon: Image.asset(
                    'lib/ui/assets/images/setting-4.png',
                    height: 20,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Image.asset(
                    'lib/ui/assets/images/notification-bing.png',
                    height: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
