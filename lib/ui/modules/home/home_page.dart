import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_garden/data/usecase/remote_load_authentication.dart';
import 'package:my_garden/data/usecase/remote_load_product.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/helpers/i18n/resources.dart';
import 'package:my_garden/ui/modules/home/components/custom_carousel.dart';
import 'package:my_garden/ui/modules/home/components/custom_menu_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final remoteLoadAuthentication = RemoteLoadAuthentication();
  User? currentUser;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  void _getUser() {
    setState(() {
      currentUser = remoteLoadAuthentication.getCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final remoteLoadProduct = Provider.of<RemoteLoadProduct>(context);
    return Scaffold(
      appBar: AppBar(
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
                    height: 42,
                    width: 42,
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
                            ),
                          )
                        : Image.asset('lib/ui/assets/icons/user.png'),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: R.string.greeting,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: '${currentUser?.displayName}',
                        style: const TextStyle(
                          fontSize: 18,
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
      drawer:
          CustomMenuDrawer(remoteLoadAuthentication: remoteLoadAuthentication),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 32,
                right: 12,
                left: 12,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lançamentos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver todos',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryGreenColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: remoteLoadProduct.load(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao carregar produtos'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Nenhum produto encontrado.'),
                  );
                } else {
                  final products = snapshot.data ?? [];

                  return CustomCarousel(
                    items: products,
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 32,
                right: 12,
                left: 12,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Destaques',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver todos',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryGreenColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: remoteLoadProduct.load(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao carregar produtos'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Nenhum produto encontrado.'),
                  );
                } else {
                  final products = snapshot.data ?? [];

                  return CustomCarousel(
                    items: products,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
