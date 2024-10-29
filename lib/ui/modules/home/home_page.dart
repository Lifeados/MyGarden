import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/home/components/menu/menu_button_label.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String pathIcon = 'lib/ui/assets/icons/';
  final String pathImage = 'lib/ui/assets/images/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: SvgPicture.asset(
                '${pathIcon}menu.svg',
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                child: SvgPicture.asset(
                  '${pathImage}logo.svg',
                ),
              ),
              MenuButtonLabel(
                icon: '${pathIcon}profile.svg',
                label: 'My profile',
                onPressed: () {},
              ),
              MenuButtonLabel(
                icon: '${pathIcon}location.svg',
                label: 'My Address',
                onPressed: () {},
              ),
              MenuButtonLabel(
                icon: '${pathIcon}orderbox.svg',
                label: 'My Order',
                onPressed: () {},
              ),
              MenuButtonLabel(
                icon: '${pathIcon}favorite.svg',
                label: 'My Favorite',
                onPressed: () {},
              ),
              MenuButtonLabel(
                icon: '${pathIcon}settings.svg',
                label: 'Settings',
                onPressed: () {},
              ),
              MenuButtonLabel(
                icon: '${pathIcon}support.svg',
                label: 'Help & Support',
                onPressed: () {},
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32, bottom: 10),
                child: Divider(
                  indent: 16,
                  endIndent: 16,
                  color: AppColors.primaryGreyColor,
                ),
              ),
              MenuButtonLabel(
                label: 'Privacy Policy',
                onPressed: () {},
              ),
              MenuButtonLabel(
                label: 'Terms & Conditions',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
