import 'package:flutter/material.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  List<OnbordingData> imagePaths = [
    OnbordingData(
      'lib/ui/modules/assets/images/tomate.png',
      'Sementes de ',
      'tomate',
      'Nossas sementes são sinônimo de \n qualidade e alta produtividade.',
    ),
    OnbordingData(
      'lib/ui/modules/assets/images/alface.png',
      'Sementes de  ',
      'alface',
      'Selecionadas e desenvolvidas para oferecer alto desempenho,\n resistência a doenças e adaptabilidade às mais diversas condições de cultivo',
    ),
    OnbordingData(
      'lib/ui/modules/assets/images/semente.png',
      'Mais de 40 tipos de ',
      'sementes.',
      'Crescendo plantas vigorosas e frutos de altíssima qualidade, com sabor, \n cor e textura  que atendem aos padrões mais exigentes do mercado.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: onPageChanged,
                controller: _pageController,
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            imagePaths[index].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: imagePaths[index].titleBlack,
                                    style: const TextStyle(
                                      color: AppColors.primaryDarkColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  TextSpan(
                                    text: imagePaths[index].titleGreen,
                                    style: const TextStyle(
                                      color: AppColors.primaryGreenColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  imagePaths[index].description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                dotHeight: 4,
                dotWidth: 4,
                activeDotColor: AppColors.primaryGreenColor,
                dotColor: AppColors.primaryGreenColor,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 50),
        child: currentPage == 2
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.primaryGreenColor,
                  fixedSize: const Size(335, 56),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Começar',
                  style: TextStyle(
                    color: AppColors.primaryWhiteColor,
                    fontSize: 15,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      if (currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: const Text(
                      'Voltar',
                      style: TextStyle(
                        color: AppColors.primaryDarkColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.primaryGreenColor,
                        fixedSize: const Size(138, 56)),
                    onPressed: () {
                      if (currentPage < 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: const Text(
                      'Próximo',
                      style: TextStyle(
                        color: AppColors.primaryWhiteColor,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class OnbordingData {
  final String image;
  final String titleBlack;
  final String titleGreen;
  final String description;

  OnbordingData(this.image, this.titleBlack, this.titleGreen, this.description);
}
