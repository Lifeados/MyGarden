import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/home/components/most_popular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _getGreetingMessage() {
    final hourNow = DateTime.now().hour;
    if (hourNow < 12) {
      return 'Good Morning';
    } else if (hourNow < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  Widget _buildIconButton(String assetPath, {VoidCallback? onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        assetPath,
        height: 20,
        width: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final greetingMessage = _getGreetingMessage();
    return Scaffold(
      backgroundColor: AppColors.cardBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(154, 160, 154, 0.1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconButton('lib/ui/assets/icons/frame-20.svg'),
            Row(
              children: [
                _buildIconButton('lib/ui/assets/icons/setting-4.svg'),
                _buildIconButton('lib/ui/assets/icons/notification-bing.svg'),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(154, 160, 154, 0.1),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$greetingMessage 👋',
                style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 20),
                child: Text(
                  'Find Your Favourite Plants Here',
                  style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, bottom: 6, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 10),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      color: AppColors.secondaryTextColor,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIcon: Padding(
                      padding:
                          const EdgeInsets.only(top: 7.0, bottom: 7, right: 8),
                      child: SvgPicture.asset(
                        'lib/ui/assets/icons/search-normal.svg',
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 30,
                      minHeight: 30,
                    ),
                  ),
                ),
              ),
              // const MostPopular(),
            ],
          ),
        ),
      ),
    );
  }
}
