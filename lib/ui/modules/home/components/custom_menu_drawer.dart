import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/data/usecase/remote_load_authentication.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/home/components/menu_button_label.dart';

class CustomMenuDrawer extends StatelessWidget {
  final RemoteLoadAuthentication remoteLoadAuthentication;

  const CustomMenuDrawer({
    super.key,
    required this.remoteLoadAuthentication,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: SvgPicture.asset(
                'lib/ui/assets/images/logo.svg',
              ),
            ),
            MenuButtonLabel(
              icon: 'lib/ui/assets/icons/profile.svg',
              label: 'My profile',
              onPressed: () {},
            ),
            MenuButtonLabel(
              icon: 'lib/ui/assets/icons/location.svg',
              label: 'My Address',
              onPressed: () {},
            ),
            MenuButtonLabel(
              icon: 'lib/ui/assets/icons/orderbox.svg',
              label: 'My Order',
              onPressed: () {},
            ),
            MenuButtonLabel(
              icon: 'lib/ui/assets/icons/favorite.svg',
              label: 'My Favorite',
              onPressed: () {},
            ),
            MenuButtonLabel(
              icon: 'lib/ui/assets/icons/settings.svg',
              label: 'Settings',
              onPressed: () {},
            ),
            MenuButtonLabel(
              icon: 'lib/ui/assets/icons/support.svg',
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
              label: 'Política',
              onPressed: () {},
            ),
            MenuButtonLabel(
              label: 'Terms & Conditions',
              onPressed: () {},
            ),
            const SizedBox(
              height: 18,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primaryGreyColor,
                  foregroundColor: AppColors.primaryDarkColor),
              onPressed: () async {
                await remoteLoadAuthentication.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Text(
                    'Sair do aplicativo',
                    style: TextStyle(fontSize: 15),
                  ),
                  Icon(
                    Icons.logout_sharp,
                    color: AppColors.primaryDarkColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
