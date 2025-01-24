import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_garden/data/usecase/remote_load_authentication.dart';
import 'package:my_garden/data/usecase/remote_load_product.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/helpers/i18n/resources.dart';
import 'package:my_garden/ui/modules/home/components/carousel_label.dart';
import 'package:my_garden/ui/modules/home/components/custom_carousel.dart';
import 'package:my_garden/ui/modules/home/components/custom_menu_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  User? currentUser;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() {
    final remoteLoadAuthentication = Provider.of<RemoteLoadAuthentication>(
      context,
      listen: false,
    );
    setState(() {
      currentUser = remoteLoadAuthentication.getCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final remoteLoadProduct = Provider.of<RemoteLoadProduct>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        title: Builder(
          builder: (context) {
            return Row(
              spacing: 6,
              children: [
                IconButton(
                  style: IconButton.styleFrom(),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryGreenColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: currentUser?.photoURL != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '${currentUser!.photoURL}',
                              fit: BoxFit.contain,
                              width: 42,
                            ),
                          )
                        : Image.asset(
                            'lib/ui/assets/icons/user.png',
                            fit: BoxFit.contain,
                            width: 42,
                          ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: R.string.greeting,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryDarkColor,
                    ),
                    children: [
                      TextSpan(
                        text: '${currentUser?.displayName}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryGreenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      drawer: const CustomMenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                future: remoteLoadProduct.load(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(R.string.errorLoadingProduts),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(R.string.noProdutsFound),
                    );
                  } else {
                    final products = snapshot.data ?? [];

                    return Column(
                      children: [
                        CarouselLabel(
                          title: R.string.launchesCarouselTitle,
                        ),
                        CustomCarousel(
                          items: products,
                        ),
                        CarouselLabel(
                          title: R.string.featuredCarouselTitle,
                        ),
                        CustomCarousel(
                          items: products,
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
