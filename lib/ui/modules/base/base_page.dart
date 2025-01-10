import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/base/components/custom_bottom_navigation_icon.dart';
import 'package:my_garden/ui/modules/cart/cart_page.dart';
import 'package:my_garden/ui/modules/home/home_page.dart';
import 'package:my_garden/ui/modules/search/search_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentPageIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomePage(),
          SearchPage(),
          Container(
            color: Colors.purple,
          ),
          const CartPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
            pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryGreenColor,
        unselectedItemColor: AppColors.secondaryDarkColor,
        items: [
          BottomNavigationBarItem(
            icon: CustomBottomNavigationIcon(
              assetPath: 'lib/ui/assets/icons/home.svg',
              isSelected: currentPageIndex == 0,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavigationIcon(
              assetPath: 'lib/ui/assets/icons/search.svg',
              isSelected: currentPageIndex == 1,
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavigationIcon(
              assetPath: 'lib/ui/assets/icons/scanner.svg',
              isSelected: currentPageIndex == 2,
            ),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavigationIcon(
              assetPath: 'lib/ui/assets/icons/mycart.svg',
              isSelected: currentPageIndex == 3,
            ),
            label: 'Carrinho',
          ),
        ],
      ),
    );
  }
}
