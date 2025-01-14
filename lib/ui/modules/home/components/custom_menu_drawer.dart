import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/data/usecase/remote_load_authentication.dart';
import 'package:my_garden/shared/components/custom_text_button.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/helpers/i18n/resources.dart';

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
            CustomTextButton(
              icon: 'lib/ui/assets/icons/profile.svg',
              label: R.string.myProfileLabel,
              onPressed: () {},
            ),
            CustomTextButton(
              icon: 'lib/ui/assets/icons/orderbox.svg',
              label: R.string.myOrderLabel,
              onPressed: () {},
            ),
            CustomTextButton(
              icon: 'lib/ui/assets/icons/settings.svg',
              label: R.string.settingsLabel,
              onPressed: () {},
            ),
            CustomTextButton(
              icon: 'lib/ui/assets/icons/support.svg',
              label: R.string.helpLabel,
              onPressed: () {},
            ),
            CustomTextButton(
              icon: 'lib/ui/assets/icons/privacy.svg',
              label: R.string.privacyPolicyLabel,
              onPressed: () {},
            ),
            CustomTextButton(
              icon: 'lib/ui/assets/icons/termsAndConditions.svg',
              label: R.string.termsAndConditionsLabel,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 116),
              child: TextButton(
                onPressed: () async {
                  await remoteLoadAuthentication.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Text(
                      R.string.buttonExitApp,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.dangerColor,
                      ),
                    ),
                    const Icon(
                      Icons.logout_sharp,
                      color: AppColors.dangerColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
