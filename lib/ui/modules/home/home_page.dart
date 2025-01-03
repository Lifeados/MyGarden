import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_garden/data/usecase/remote_load_authentication.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/home/components/favorite_item.dart';
import 'package:my_garden/ui/modules/home/components/menu/menu_button_label.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String pathIcon = 'lib/ui/assets/icons/';
  final String pathImage = 'lib/ui/assets/images/';

  final _remoteLoadAuthentication = RemoteLoadAuthentication();

  final List<Map<String, String>> items = [
    {
      'image': 'lib/ui/assets/images/terceira_planta.png',
      'title': 'Peperomia Flex',
      'subtitle': 'Indoor Plant',
      'description': '60.00',
    },
    {
      'image': 'lib/ui/assets/images/medallion_plant.png',
      'title': 'Medallion Plant',
      'subtitle': 'Indoor Plant',
      'description': '55.00',
    },
    {
      'image': 'lib/ui/assets/images/terceira_planta.png',
      'title': 'Peperomia Flex',
      'subtitle': 'Indoor Plant',
      'description': '60.00',
    },
    {
      'image': 'lib/ui/assets/images/terceira_planta.png',
      'title': 'Peperomia Flex',
      'subtitle': 'Indoor Plant',
      'description': '60.00',
    },
  ];

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
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primaryGreyColor,
                    foregroundColor: AppColors.primaryDarkColor),
                onPressed: () async {
                  await _remoteLoadAuthentication.signOut();
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
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Good Morning 👋',
                style: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontSize: 36,
                    fontWeight: FontWeight.bold)),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 20,
              left: 20,
            ),
            child: Text(
              'Find Your Favourite Plants Here',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: SizedBox(
                  width: 335,
                  height: 56,
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: 'search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: SvgPicture.asset(
                            'lib/ui/assets/icons/search-normal.svg',
                          )),
                    ),
                  ))),
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20, bottom: 20),
                child: Text(
                  'Most Popular',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 180, bottom: 20),
                child: Text(
                  'View all',
                  style: TextStyle(
                      fontSize: 12, color: AppColors.primaryGreenColor),
                ),
              )
            ],
          ),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 230,
                  height: 312,
                  decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 10,
                    bottom: 16,
                    left: 10,
                  ),
                  child: Column(
                    children: [
                      // Imagem
                      Container(
                        width: 210,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.backgroundColor,
                        ),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          items[index]['image']!,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['title']!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryDarkColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 10),
                                    child: Text(
                                      items[index]['subtitle']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.secondaryGreyColor,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '\$${items[index]['description']!}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: AppColors.primaryDarkColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          elevation: 0,
                                          backgroundColor:
                                              AppColors.primaryGreenColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        child: SvgPicture.asset(
                                            'lib/ui/assets/icons/leaf.svg')),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20, bottom: 20),
                child: Text(
                  'My Favorite',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 180, bottom: 20),
                child: Text(
                  'View all',
                  style: TextStyle(
                      fontSize: 12, color: AppColors.primaryGreenColor),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FavoriteItem(
                pathImage: 'lib/ui/assets/images/calathea-plant.png',
                title: 'Medallion Calathea',
                description: 'Indoor Plant',
                price: 75.00,
                onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FavoriteItem(
                pathImage: 'lib/ui/assets/images/medallion_plant.png',
                title: 'Calathea Plant',
                description: 'Indoor Plant',
                price: 80.00,
                onPressed: () {}),
          )
        ]),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset('${pathIcon}home.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('${pathIcon}favorite.svg'),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('${pathIcon}settings.svg'),
                label: 'Configurações',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('${pathIcon}profile.svg'),
                label: 'Perfil',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
